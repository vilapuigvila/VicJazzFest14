//
//  RootViewController.h
//  VicJazzFest
//
//  Created by albert vila puigvila on 02/04/14.
//  Copyright (c) 2014 albert vila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
{
    CGFloat    dlyTime;
    NSTimer    *timer;
    CGFloat   count;

}

@property (nonatomic, assign) NSString       *viewName;
@property (weak, nonatomic) IBOutlet UIImageView *imgVwBlur;
@property (weak, nonatomic) IBOutlet UIImageView *imgVwMain;


@end
