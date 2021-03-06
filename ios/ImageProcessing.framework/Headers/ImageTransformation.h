//
//  ImageTransformation.h
//  ImageProcessing
//
//  Copyright © 2015 das-nano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageTransformation : NSObject

/**
 Método que permite recortar una imagen
 @param image Imagen original a recortar
 @param region Región para recortar la imagen
 @returns Imagen recortada
 */
 + (UIImage *)regionOfImage:(UIImage *)image regionToApply:(CGRect)region;

@end
