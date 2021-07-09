//
//  ValiDasPayloadBidiCode.h
//  VDLibrary
//
//  Copyright © 2020 BBVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ValiDasPayload.h"
#import "ValiDasBidiResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface ValiDasPayloadBidiCode : ValiDasPayload

-(id _Nonnull)initWithElement:(ValiDasBidiResult*)element;

@end

NS_ASSUME_NONNULL_END
