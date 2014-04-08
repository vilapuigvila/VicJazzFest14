//
//  DetailViewController.m
//  VicJazzFest
//
//  Created by albert vila puigvila on 08/04/14.
//  Copyright (c) 2014 albert vila. All rights reserved.
//

#import "DetailViewController.h"
#import "AVPDataRecived.h"
#import <XCDYouTubeVideoPlayerViewController.h>

@interface DetailViewController ()

@end

@implementation DetailViewController



-(void)setAvpData:(AVPDataRecived *)avpData
{
    if (_avpData != avpData) {
        _avpData = avpData;
    }
}
-(void)setImgRecived:(UIImage *)imgRecived
{
    if (_imgRecived != imgRecived) {
        _imgRecived = imgRecived;
    }
}
- (void)configure
{
    self.lblTitle.text = _avpData.nameGroup;
    self.txtFldDesc.text = _avpData.description;
    
    
    
    self.imgV.image = self.imgRecived;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configure];

    
}

- (IBAction)ytbPressed:(id)sender
{
    NSString *link = _avpData.linkToYoutube;
    
    XCDYouTubeVideoPlayerViewController *player = [[XCDYouTubeVideoPlayerViewController alloc]initWithVideoIdentifier:link];
    
    [self presentMoviePlayerViewControllerAnimated:player];
//    [self presentViewController:player animated:YES completion:nil];
    
}

- (IBAction)webPressed:(id)sender
{
    
}













- (IBAction)btBackPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}





















#pragma mark - Rotation
-(BOOL)shouldAutorotate
{
    return NO;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
