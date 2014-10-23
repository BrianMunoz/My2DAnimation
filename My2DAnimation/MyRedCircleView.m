//
//  MyRedCircle.m
//  My2DAnimation
//
//  Created by Brian Munoz on 10/23/14.
//  Copyright (c) 2014 Brian Munoz. All rights reserved.
//

#import "MyRedCircleView.h"

@implementation MyRedCircleView

- (void)updateDisplay:(id)notUsed
{
    [self setNeedsDisplay];
    [self performSelector:@selector(updateDisplay:)
               withObject:nil
               afterDelay:1.0/20.0f];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:
                          [self bounds]];
    //path.lineWidth = 20.0;
    [path addClip];
    [[UIColor redColor] set];
    [[UIBezierPath bezierPathWithRect:[self bounds]] fill];
}


@end
