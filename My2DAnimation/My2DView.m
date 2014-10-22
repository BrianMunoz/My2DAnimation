//
//  My2DView.m
//  My2DAnimation
//
//  Created by Brian Munoz on 10/22/14.
//  Copyright (c) 2014 Brian Munoz. All rights reserved.
//

#import "My2DView.h"

@implementation My2DView

- (void)updateDisplay:(id)notUsed
{
    [self setNeedsDisplay];
    [self performSelector:@selector(updateDisplay:)
               withObject:nil
               afterDelay:1.0/20.0f];
}


- (void)awakeFromNib
{
    [self updateDisplay:nil];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:
                          [self bounds]];
    //path.lineWidth = 20.0;
    [path addClip];
    [[UIColor blueColor] set];
    [[UIBezierPath bezierPathWithRect:[self bounds]] fill];
    [[UIColor whiteColor] set];
    [[UIColor colorWithRed:(random() % 256) / 255.0
                     green:(random() % 256) / 255.0
                      blue:(random() % 256) / 255.0
                     alpha:1.0f] set];
    CGRect tempRect = [self bounds];
    tempRect.size.width *= 0.5;
    [[UIBezierPath bezierPathWithRect:tempRect] fill];
}


@end
