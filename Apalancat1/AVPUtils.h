//
//  AVPUtils.h
//  1TapDraw
//
//  Created by Carles Coll on 23/01/14.
//  Copyright (c) 2014 1Tapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVPUtils : NSObject

+ (UIImage*) scaleImage:(UIImage*)imageOrig scaledToSize:(CGSize)newSize;
+ (UIImage *)imageByCropping:(UIImage *)image toSize:(CGSize)size;
+ (UIImage *)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect;
+ (NSString *)uuid;

@end
