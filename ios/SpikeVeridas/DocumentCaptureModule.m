//
//  DocumentCaptureModule.m
//  Motosharing
//
//  Created by Gorka Moreno on 21/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "DocumentCaptureController.h"
#import "DocumentCaptureModule.h"

@implementation DocumentCaptureModule
{
  bool hasListeners;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(start:(NSArray*)documents andConfiguration:(NSDictionary*)configuration)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    DocumentCaptureController *controller = [[DocumentCaptureController alloc] initWithDocuments:documents andConfiguration:configuration andModule:self];
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:controller animated:NO completion:nil];
  });
}

-(NSArray<NSString*>*)supportedEvents
{
  return @[kEventOnDocumentImage, kEventOnFinish];
}

-(void)sendEvent:(NSString*)eventName withBody:(NSDictionary*)body
{
  if (hasListeners) {
    [self sendEventWithName:eventName body:body];
  }
}

-(void)startObserving
{
  [super startObserving];
  
  hasListeners = YES;
}

-(void)stopObserving
{
  [super stopObserving];
  
  hasListeners = NO;
}

@end
