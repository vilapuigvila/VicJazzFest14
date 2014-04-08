//
//  DetailViewController.h
//  VicJazzFest
//
//  Created by albert vila puigvila on 08/04/14.
//  Copyright (c) 2014 albert vila. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVPDataRecived;

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel     *lblTitle;
@property (weak, nonatomic) IBOutlet UITextView  *txtFldDesc;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@property (strong, nonatomic) UIImage            *imgRecived;

@property (strong, nonatomic) AVPDataRecived     *avpData;


#pragma mark - Actions
- (IBAction)btBackPressed:(id)sender;
- (IBAction)ytbPressed:(id)sender;
- (IBAction)webPressed:(id)sender;





@end
