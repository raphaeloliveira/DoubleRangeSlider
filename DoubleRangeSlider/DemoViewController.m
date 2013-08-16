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
    self.yearOptions = @[@"1950 or before", @"1955", @"1960", @"1965", @"1970", @"1975", @"1980", @"1985", @"1990", @"1991", @"1992", @"1993", @"1993", @"1994", @"1995", @"1996", @"1997", @"1998", @"1999", @"2000", @"2001", @"2002", @"2003", @"2004", @"2005", @"2006", @"2007", @"2008", @"2009", @"2010", @"2011", @"2012", @"2013"];
    [self addBedroomsDoubleRangeSlider];
    [self addKilometersDoubleRangeSlider];
}

#pragma mark - Private

- (void)addBedroomsDoubleRangeSlider
{
    CGRect frame = CGRectMake(10.0, 100.0, 300.0, 100.0);
    DoubleRangeSlider *slider = [[DoubleRangeSlider alloc] initWithFrame:frame numberOfSegments:5];
    [slider addTarget:self action:@selector(onBedroomsDoubleRangeSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    slider.lineColor = [UIColor orangeColor];
    slider.backgroundColor = [UIColor whiteColor];
    slider.lineHeight = 2.0;
    slider.leftHandlerImage = [UIImage imageNamed:@"blue_handler"];
    slider.rightHandlerImage = [UIImage imageNamed:@"blue_handler"];
    [self.view addSubview:slider];
    [self onBedroomsDoubleRangeSliderValueChanged:slider];
}

- (void)onBedroomsDoubleRangeSliderValueChanged:(DoubleRangeSlider *)doubleRangeSlider {
    self.bedroomsLeftOption.text = [NSString stringWithFormat:@"%d", doubleRangeSlider.currentLeftSegment + 1];
    self.bedroomsRightOption.text = [NSString stringWithFormat:@"%d", doubleRangeSlider.currentRightSegment + 1];
}

- (void)addKilometersDoubleRangeSlider
{
    CGRect frame = CGRectMake(10.0, 300.0, 300.0, 100.0);
    DoubleRangeSlider *slider = [[DoubleRangeSlider alloc] initWithFrame:frame numberOfSegments:self.yearOptions.count];
    [slider addTarget:self action:@selector(onKilometersDoubleRangeSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    slider.lineColor = [UIColor orangeColor];
    slider.backgroundColor = [UIColor whiteColor];
    slider.lineHeight = 2.0;
    slider.leftHandlerImage = [UIImage imageNamed:@"blue_handler"];
    slider.rightHandlerImage = [UIImage imageNamed:@"blue_handler"];
    [self.view addSubview:slider];
    [self onKilometersDoubleRangeSliderValueChanged:slider];
}

- (void)onKilometersDoubleRangeSliderValueChanged:(DoubleRangeSlider *)doubleRangeSlider {
    self.yearLeftOption.text = [self.yearOptions objectAtIndex:doubleRangeSlider.currentLeftSegment];
    self.yearRightOption.text = [self.yearOptions objectAtIndex:doubleRangeSlider.currentRightSegment];
}

@end
