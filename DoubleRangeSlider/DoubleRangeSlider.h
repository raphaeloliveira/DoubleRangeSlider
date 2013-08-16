//
//  DoubleRangeSlider.h
//  DoubleRangeSlider
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleRangeSlider : UIControl

@property (assign, nonatomic) CGFloat lineHeight;
@property (strong, nonatomic) UIColor *lineColor;
@property (strong, nonatomic) UIColor *backgroundColor;
@property (strong, nonatomic) UIView *leftHandler;
@property (strong, nonatomic) UIView *rightHandler;
@property (strong, nonatomic) UIView *currentMovingHandler;

@end
