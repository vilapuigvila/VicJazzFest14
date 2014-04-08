//
//  NSObject+MyUtils.m
//  MyUtils
//
//  Created by albert vila on 09/08/13.
//  Copyright (c) 2013 albert vila. All rights reserved.
//

#import "NSObject+MyUtils.h"

@implementation NSObject (MyUtils)

@dynamic mainAppDelegate;

#pragma mark Delay Methods

- (AppDelegate*) mainAppDelegate
{
    return [AppDelegate mainAppDelegate];
}

-(void)performBlock:(void (^)(void))block
         afterDelay:(NSTimeInterval)delayInSeconds{
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}




@end
