//
//  DoubleRangeSlider.h
//  DoubleRangeSlider
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleRangeSlider : UIControl

@property (assign, nonatomic) NSUInteger numberOfSegments;
@property (assign, nonatomic) NSUInteger currentLeftSegment;
@property (assign, nonatomic) NSUInteger currentRightSegment;
@property (assign, nonatomic) CGFloat lineHeight;
@property (assign, nonatomic) CGFloat minDistanceBetweenHandlersCenter;
@property (strong, nonatomic) UIColor *lineColor;
@property (strong, nonatomic) UIColor *backgroundColor;
@property (strong, nonatomic) UIImage *leftHandlerImage;
@property (strong, nonatomic) UIImage *rightHandlerImage;

- (id)initWithFrame:(CGRect)frame numberOfSegments:(NSUInteger)numberOfSegments;

@end
