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
@property (assign, nonatomic) CGFloat minDistanceBetweenHandlers;
@property (strong, nonatomic) UIColor *lineColor;
@property (strong, nonatomic) UIColor *backgroundColor;

@end
