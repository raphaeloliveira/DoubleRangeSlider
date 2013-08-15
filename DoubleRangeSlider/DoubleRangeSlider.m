//
//  DoubleRangeSlider.m
//  DoubleRangeSlider
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import "DoubleRangeSlider.h"

@implementation DoubleRangeSlider

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.opaque = NO;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self setBackgroundColorToClearColor];
    [self drawLineYAxisCentered];
}

#pragma mark - Private

- (void)setBackgroundColorToClearColor {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, self.bounds);
}

- (void)drawLineYAxisCentered {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(self.bounds), CGRectGetMidY(self.bounds));
    CGContextAddLineToPoint(context, CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds));
    CGContextStrokePath(context);
}

@end
