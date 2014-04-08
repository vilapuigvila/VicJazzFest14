//
//  RootViewController.m
//  VicJazzFest
//
//  Created by albert vila puigvila on 02/04/14.
//  Copyright (c) 2014 albert vila. All rights reserved.
//

#import "RootViewController.h"



@interface RootViewController ()

@end

@implementation RootViewController


-(void)setViewName:(NSString *)viewName
{
    if (_viewName != viewName) {
        _viewName = viewName;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self configureView];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)configureView
{
    if ([_viewName isEqual:@"show_view"])
    {
        dlyTime = 0.0f;
    }else
    {
        dlyTime = 0.0f;
    }
    [self performSelector:@selector(toInitialVC) withObject:self afterDelay:dlyTime];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}
- (void)toInitialVC
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"initial_vc"];
    [self.navigationController pushViewController:vc animated:NO];
    
    //[self performSegueWithIdentifier:@"toInitial" sender:nil];
}
- (void)sumSeconds
{
    count += 0.750f;
    
    UIImage *im = [UIImage imageNamed:@"fiord"];
    [self.imgVwBlur setImageToBlur:im blurRadius:25 - count completionBlock:nil];
    //NSLog(@"Test %f", count);
    if (count >= 20) {
        [timer invalidate];
        timer = nil;
    }
}
- (void)bounceViewlayer:(CALayer *)name
               forward1:(CGFloat)floatOne
                  back1:(CGFloat)floatTwo
               forward2:(CGFloat)floatThree
                rewind2:(CGFloat)floatFour
               duration:(CGFloat)timeInterval{
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D forward = CATransform3DMakeScale(floatOne, floatOne, 1);
    CATransform3D back = CATransform3DMakeScale(floatTwo, floatTwo, 1);
    CATransform3D forward2 = CATransform3DMakeScale(floatThree, floatThree, 1);
    CATransform3D back2 = CATransform3DMakeScale(floatFour, floatFour, 1);
    
    [bounce setValues:[NSArray arrayWithObjects:
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:forward],
                       [NSValue valueWithCATransform3D:back],
                       [NSValue valueWithCATransform3D:forward2],
                       [NSValue valueWithCATransform3D:back2],nil]];
    
    bounce.duration = timeInterval;
    
    [name addAnimation:bounce forKey:@"bounceAnimation"];
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
