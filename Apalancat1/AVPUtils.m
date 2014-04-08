//
//  AVPUtils.m
//  1TapDraw
//
//  Created by Carles Coll on 23/01/14.
//  Copyright (c) 2014 1Tapps. All rights reserved.
//

#import "AVPUtils.h"

@implementation AVPUtils

+ (UIImage*)scaleImage:(UIImage*)imageOrig scaledToSize:(CGSize)newSize {
    
    CGSize scaleSize = CGSizeMake(newSize.width*imageOrig.scale,newSize.height*imageOrig.scale);

    UIGraphicsBeginImageContext(scaleSize);
    [imageOrig drawInRect:CGRectMake(0, 0, newSize.width*imageOrig.scale, newSize.height*imageOrig.scale)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - Crop Image
+ (UIImage *)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect {

    CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], rect);
    UIImage *cropped2 = [UIImage imageWithCGImage:imageRef scale:imageToCrop.scale orientation:imageToCrop.imageOrientation];
    CGImageRelease(imageRef);
    

    return cropped2;
}

#pragma mark - Crop to center image
+ (UIImage *)imageByCropping:(UIImage *)image toSize:(CGSize)size
{
    
    double x = (image.size.width*image.scale - size.width*image.scale) / 2.0;
    double y = (image.size.height*image.scale - size.height*image.scale) / 2.0;
    
    CGRect cropRect = CGRectMake(x, y, size.height*image.scale, size.width*image.scale);
    return [AVPUtils imageByCropping:image toRect:cropRect];
    
    /*
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], cropRect);
    
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return cropped;*/
}

+ (NSString *)uuid
{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge NSString *)uuidStringRef;
}



@end
