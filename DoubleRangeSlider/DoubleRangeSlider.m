//
//  DoubleRangeSlider.m
//  DoubleRangeSlider
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import "DoubleRangeSlider.h"

CGFloat const kDefaultLineHeight = 2.0;
CGFloat const kDefaultHandlerSize = 44.0;

@implementation DoubleRangeSlider

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.opaque = NO;
        [self setDefaultValues];
        [self initHandlers];
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

- (void)initHandlers {
    [self initLeftHandler];
    [self initRightHandler];
}

- (void)initLeftHandler {
    CGRect leftHandlerFrame = CGRectMake(0.0, 0.0, kDefaultHandlerSize, kDefaultHandlerSize);
    self.leftHandler = [[UIView alloc] initWithFrame:leftHandlerFrame];
    self.leftHandler.backgroundColor = [UIColor redColor];
    self.leftHandler.center = CGPointMake(0.0, CGRectGetMidY(self.bounds));
    [self addSubview:self.leftHandler];
}

- (void)initRightHandler {
    CGRect rightHandlerFrame = CGRectMake(0.0, 0.0, kDefaultHandlerSize, kDefaultHandlerSize);
    self.rightHandler = [[UIView alloc] initWithFrame:rightHandlerFrame];
    self.rightHandler.backgroundColor = [UIColor blueColor];
    self.rightHandler.center = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds));
    [self addSubview:self.rightHandler];
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
