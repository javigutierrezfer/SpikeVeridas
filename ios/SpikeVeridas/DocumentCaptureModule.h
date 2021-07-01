//
//  DocumentCaptureModule.h
//  Motosharing
//
//  Created by Gorka Moreno on 21/02/2020.
//

#import <Foundation/Foundation.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

#define kEventOnDocumentImage   @"DocumentCapture.onDocumentImage"
#define kEventOnFinish          @"DocumentCapture.onFinish"

NS_ASSUME_NONNULL_BEGIN

@interface DocumentCaptureModule : RCTEventEmitter <RCTBridgeModule>

-(void)sendEvent:(NSString*)eventName withBody:(NSDictionary*)body;

@end

NS_ASSUME_NONNULL_END
