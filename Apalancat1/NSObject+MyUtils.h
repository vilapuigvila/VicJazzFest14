//
//  NSObject+MyUtils.h
//  MyUtils
//
//  Created by albert vila on 09/08/13.
//  Copyright (c) 2013 albert vila. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MyUtils)

@property (nonatomic, weak) AppDelegate *mainAppDelegate;

- (void)performBlock:(void (^)(void))block
          afterDelay:(NSTimeInterval)delayInSeconds;


@end
