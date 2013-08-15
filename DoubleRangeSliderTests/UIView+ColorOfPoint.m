//
//  UIView+ColorOfPoint.m
//  DoubleRangeSlider
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import "UIView+ColorOfPoint.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIView (ColorOfPoint)

#pragma mark - Public

- (UIColor *)colorOfPoint:(CGPoint)point {
    unsigned char pixel[4] = {0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast);
    CGContextTranslateCTM(context, -point.x, -point.y);    
    [self.layer renderInContext:context];
    
    CGFloat red = [self roundFloatToTwoDecimalSpaces:pixel[0] / 255.0];
    CGFloat green = [self roundFloatToTwoDecimalSpaces:pixel[1] / 255.0];
    CGFloat blue = [self roundFloatToTwoDecimalSpaces:pixel[2] / 255.0];
    CGFloat alpha = [self roundFloatToTwoDecimalSpaces:pixel[3] / 255.0];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

#pragma mark - Private

- (CGFloat)roundFloatToTwoDecimalSpaces:(float)number {
    return roundf(number * 100) / 100.0;
}

@end
