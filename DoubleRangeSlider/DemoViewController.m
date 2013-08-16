//
//  ViewController.m
//  DoubleRangeSlider
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import "DemoViewController.h"

#import "DoubleRangeSlider.h"

@implementation DemoViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self addDoubleRangeSlider];
}

#pragma mark - Private

- (void)addDoubleRangeSlider
{
    CGRect frame = CGRectMake(10.0, 230.0, 300.0, 100.0);
    DoubleRangeSlider *slider = [[DoubleRangeSlider alloc] initWithFrame:frame numberOfSegments:5];
    [slider addTarget:self action:@selector(onDoubleRangeSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    slider.lineColor = [UIColor orangeColor];
    slider.backgroundColor = [UIColor whiteColor];
    slider.lineHeight = 2.0;
    slider.leftHandlerImage = [UIImage imageNamed:@"blue_handler"];
    slider.rightHandlerImage = [UIImage imageNamed:@"blue_handler"];
    [self.view addSubview:slider];
    [self onDoubleRangeSliderValueChanged:slider];
}

- (void)onDoubleRangeSliderValueChanged:(DoubleRangeSlider *)doubleRangeSlider {
    self.leftOption.text = [NSString stringWithFormat:@"%d bedroom(s)", doubleRangeSlider.currentLeftSegment + 1];
    self.rightOption.text = [NSString stringWithFormat:@"%d bedroom(s)", doubleRangeSlider.currentRightSegment + 1];
}

@end
