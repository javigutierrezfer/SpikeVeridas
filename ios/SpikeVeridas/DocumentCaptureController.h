//
//  DocumentCaptureController.h
//  Motosharing
//
//  Created by Gorka Moreno on 20/02/2020.
//

#import <Foundation/Foundation.h>
#import "VDDocumentCapture/VDDocumentCapture.h"
#import "DocumentCaptureModule.h"

#define kData       @"data"
#define kType       @"type"
#define kDocument   @"document"
#define kSuccess    @"success"

NS_ASSUME_NONNULL_BEGIN

@interface DocumentCaptureController : UIViewController <VDDocumentCaptureProtocol>

-(id) initWithDocuments:(NSArray*)documents andConfiguration:(NSDictionary*)configuration andModule:(DocumentCaptureModule*) module;

@property(nonatomic) DocumentCaptureModule *module;
@property(nonatomic) NSArray *documents;
@property(nonatomic) NSDictionary *configuration;

@end

NS_ASSUME_NONNULL_END
