//
//  DoubleRangeSlider.m
//  DoubleRangeSlider
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import "DoubleRangeSlider.h"

CGFloat const kDefaultLineHeight = 2.0;

@implementation DoubleRangeSlider

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.opaque = NO;
        [self setDefaultValues];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawBackgroundColor];
    [self drawLineYAxisCentered];
}

#pragma mark - Private

- (void)setDefaultValues {
    self.lineHeight = kDefaultLineHeight;
    self.lineColor = [UIColor blackColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawBackgroundColor {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    CGContextFillRect(context, self.bounds);
}

- (void)drawLineYAxisCentered {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGContextSetLineWidth(context, self.lineHeight);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(self.bounds), CGRectGetMidY(self.bounds));
    CGContextAddLineToPoint(context, CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds));
    CGContextStrokePath(context);
}

@end
