//
//  UIColor+IsEqualToColor.m
//  DoubleRangeSlider
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import "UIColor+IsEqualToColor.h"

@implementation UIColor (IsEqualToColor)

#pragma mark - Public

- (BOOL)isEqualToColor:(UIColor *)otherColor {
    UIColor *selfColor = [self convertColorToRGBSpace:self];
    otherColor = [self convertColorToRGBSpace:otherColor];
    return [selfColor isEqual:otherColor];
}

#pragma mark - Private

- (UIColor *)convertColorToRGBSpace:(UIColor *)color {
    if(CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) == kCGColorSpaceModelMonochrome) {
        const CGFloat *oldComponents = CGColorGetComponents(color.CGColor);
        CGColorSpaceRef colorSpaceRGB = CGColorSpaceCreateDeviceRGB();
        CGFloat components[4] = {oldComponents[0], oldComponents[0], oldComponents[0], oldComponents[1]};
        UIColor *rgbColor = [UIColor colorWithCGColor:CGColorCreate(colorSpaceRGB, components)];
        CGColorSpaceRelease(colorSpaceRGB);
        return rgbColor;
    }
    else {
        return color;
    }
}

@end
