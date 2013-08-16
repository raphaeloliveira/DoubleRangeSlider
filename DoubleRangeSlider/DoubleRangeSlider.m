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

#pragma mark - UIControl

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super beginTrackingWithTouch:touch withEvent:event];
    CGPoint lastPoint = [touch locationInView:self];
    self.currentMovingHandler = [self handlerContainingPoint:lastPoint];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    if (self.currentMovingHandler) {
        [self moveHandler:self.currentMovingHandler usingTouch:touch];
    }
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
}

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

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (CGRectContainsPoint(self.leftHandler.frame, point) || CGRectContainsPoint(self.rightHandler.frame, point)) {
        return self;
    }
    
    return [super hitTest:point withEvent:event];
}

#pragma mark - Private

- (UIView *)handlerContainingPoint:(CGPoint)point {
    if (CGRectContainsPoint(self.leftHandler.frame, point)) {
        return self.leftHandler;
    }
    else if (CGRectContainsPoint(self.rightHandler.frame, point)) {
        return self.rightHandler;
    }
    
    return nil;
}

- (void)moveHandler:(UIView *)handler usingTouch:(UITouch *)touch {    
    CGPoint location = [touch locationInView:self];
    CGPoint previousLocation = [touch previousLocationInView:self];
    handler.frame = CGRectOffset(handler.frame, location.x - previousLocation.x, 0);
}

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
