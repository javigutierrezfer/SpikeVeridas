//
//  DocumentCaptureController.m
//  Motosharing
//
//  Created by Gorka Moreno on 20/02/2020.
//

#import "DocumentCaptureController.h"
#import "DocumentCaptureModule.h"
#import "VDDocumentCapture/VDDocumentCapture.h"
#import <React/RCTLog.h>

@implementation DocumentCaptureController

-(id) initWithDocuments:(NSArray*)documents andConfiguration:(NSDictionary*)configuration andModule:(DocumentCaptureModule*) module {
  self = [super initWithNibName:nil bundle:nil];
  if(self) {
    _documents = documents;
    _configuration = configuration;
    _module = module;
  }
  
  return self;
}

- (void) viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  if([VDDocumentCapture isStarted]) {
     return;
   }

  if (_configuration && _configuration.allKeys.count > 0) {
    [VDDocumentCapture startWithDelegate:self andDocumentIds:_documents andConfiguration:_configuration];
  } else {
    [VDDocumentCapture startWithDelegate:self andDocumentIds:_documents];
  }
}

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

-(void)VDDocumentCaptured:(NSData*)imageData withCaptureType:(VDCaptureType)captureType andDocument:(NSArray<VDDocument *>*)document
{
  NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
  
  [dict setObject:[imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength] forKey:kData];
  [dict setObject:[self getCaptureTypeName:captureType] forKey:kType];
  if([document count] > 0) {
    [dict setObject:[document objectAtIndex:0].documentName forKey:kDocument];
  } else {
    [dict setObject:@"XX_XX_XXXX" forKey:kDocument];
  }
  
  [_module sendEvent:kEventOnDocumentImage withBody:dict];
}

-(void)VDDocumentAllFinished:(Boolean)processFinished;
{
  [self dismissViewControllerAnimated:NO completion:nil];
  [_module sendEvent:kEventOnFinish withBody:@{kSuccess: @(processFinished)}];
}

-(void)VDTimeWithoutPhotoTaken:(int)seconds withCaptureType:(VDCaptureType)capture
{
}

#pragma mark - Helper CaptureType

-(NSString*)getCaptureTypeName:(VDCaptureType)captureType
{
  NSString *capType = @"";
  
  switch (captureType) {
    case VD_OBVERSE_WITH_FLASH:
      capType = @"VD_OBVERSE_WITH_FLASH";
      break;
    case VD_OBVERSE_WITHOUT_FLASH:
      capType = @"VD_OBVERSE_WITHOUT_FLASH";
      break;
    case VD_REVERSE_WITHOUT_FLASH:
      capType = @"VD_REVERSE_WITHOUT_FLASH";
      break;
    case VD_REVERSE_WITH_FLASH:
      capType = @"VD_REVERSE_WITH_FLASH";
      break;
    default:
      break;
  }
  
  return capType;
}

@end
