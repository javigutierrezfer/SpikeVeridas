//
//  RectangleDetector.h
//  ImageProcessing
//
//  Copyright © 2018 das-Nano SL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"


@interface RectangleDetector : NSObject

+ (CGRect) findDocumentInImage:(UIImage*) image nearRect:(CGRect) rect;

@end
