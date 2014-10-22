//
//  ViewController.m
//  My2DAnimation
//
//  Created by Brian Munoz on 10/22/14.
//  Copyright (c) 2014 Brian Munoz. All rights reserved.
//

#import "ViewController.h"

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
                        options:UIViewAnimationOptionAutoreverse |
     UIViewAnimationOptionRepeat
                     animations:^{
                         self.viewToAnimate.center = CGPointMake(0.0f, 0);
                     }
                     completion:^(BOOL finished) {
                     }];
    
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse |
     UIViewAnimationOptionRepeat
                     animations:^{
                         self.otherViewToAnimate.center = CGPointMake(0.0f, 0);
                         self.otherViewToAnimate.alpha = 0.0f;
                     }
                     completion:^(BOOL finished) {
                     }];
    
    
    [UIView animateWithDuration:5.0
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse |
     UIViewAnimationOptionRepeat
                     animations:^{
                         self.otherViewToAnimate.center = CGPointMake(0.0f, 0);
                         self.otherViewToAnimate.transform =
                         CGAffineTransformMakeRotation(M_PI / 2.0);
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
