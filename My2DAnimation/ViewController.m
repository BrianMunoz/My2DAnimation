//
//  ViewController.m
//  My2DAnimation
//
//  Created by Brian Munoz on 10/22/14.
//  Copyright (c) 2014 Brian Munoz. All rights reserved.
//

#import "ViewController.h"
#import "MySquareView.h"

@interface ViewController ()
@property (nonatomic) IBOutlet UIView *viewToAnimate;
@property (nonatomic) IBOutlet UIView *otherViewToAnimate;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         self.viewToAnimate.center = [self findScreenCenter];
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:2.0
                                               delay:.5
                                             options:UIViewAnimationOptionAllowAnimatedContent
                                          animations:^{
                                              self.viewToAnimate.center = [self findScreenCenterLeft];
                                              
                                              
                                          }
                                          completion:^(BOOL completion){}];
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         CGRect oldBounds = self.otherViewToAnimate.frame;
                         CGRect newbounds = oldBounds;
                         newbounds.size  =  CGSizeMake(oldBounds.size.width * 2.0, oldBounds.size.height * 2.0);
                         
                         CABasicAnimation *resize = [CABasicAnimation animationWithKeyPath:@"bounds"];
                         
                         resize.fromValue = [NSValue valueWithCGRect:oldBounds];
                         resize.toValue = [NSValue valueWithCGRect:newbounds];
                         
                         self.otherViewToAnimate.layer.bounds = newbounds;
                         [self.otherViewToAnimate.layer addAnimation:resize forKey:@"bounds"];
                         self.otherViewToAnimate.center = [self findScreenCenter];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0
                                               delay:.5
                                             options:UIViewAnimationOptionAllowAnimatedContent
                                          animations:^{
                                              CGRect oldBounds = self.otherViewToAnimate.frame;
                                              CGRect newbounds = oldBounds;
                                              newbounds.size  =  CGSizeMake(oldBounds.size.width / 2.0, oldBounds.size.height / 2.0);
                                              
                                              CABasicAnimation *resize = [CABasicAnimation animationWithKeyPath:@"bounds"];
                                              
                                              resize.fromValue = [NSValue valueWithCGRect:oldBounds];
                                              resize.toValue = [NSValue valueWithCGRect:newbounds];
                                              
                                              self.otherViewToAnimate.layer.bounds = newbounds;
                                              [self.otherViewToAnimate.layer addAnimation:resize forKey:@"bounds"];
                                              self.otherViewToAnimate.center = [self findScreenCenterRight];
                                          }
                                          completion:^(BOOL completion){}];
                     }];
    
}


-(CGPoint)getScreenPoint{
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat width = screen.size.width;
    CGFloat height = screen.size.height;
    return CGPointMake(width, height);
}

-(CGPoint) findScreenCenter{
    CGPoint screenPoint = [self getScreenPoint];
    screenPoint.x = screenPoint.x/2.0;
    screenPoint.y = screenPoint.y/2.0;
    return screenPoint;
}

-(CGPoint) findScreenCenterLeft{
    CGPoint screenPoint = [self getScreenPoint];
    screenPoint.x = 0.0f;
    screenPoint.y =  screenPoint.y/2.0;
    return screenPoint;
}

-(CGPoint) findScreenCenterRight{
    CGPoint screenPoint = [self getScreenPoint];
    screenPoint.y = screenPoint.y/2.0;
    return screenPoint;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
