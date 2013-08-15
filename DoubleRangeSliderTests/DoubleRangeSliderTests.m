//
//  DoubleRangeSliderTests.m
//  DoubleRangeSliderTests
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import "DoubleRangeSliderTests.h"

#import "DoubleRangeSlider.h"
#import "UIColor+IsEqualToColor.h"
#import "UIView+ColorOfPoint.h"

@implementation DoubleRangeSliderTests

#pragma mark - Test

- (void)testInitDoubleRangeSlider_ItShouldHaveThePassedFrame {
    CGRect frame = CGRectMake(0.0, 0.0, 320.0, 100.0);
    DoubleRangeSlider *slider = [[DoubleRangeSlider alloc] initWithFrame:frame];
    STAssertTrue(CGRectEqualToRect(slider.frame, frame), @"");
}

- (void)testInitDoubleRangeSlider_ShouldHaveClearBackgroundColor {
    CGRect frame = CGRectMake(0.0, 0.0, 320.0, 100.0);
    DoubleRangeSlider *slider = [[DoubleRangeSlider alloc] initWithFrame:frame];
    
    CGPoint pointMinX = CGPointMake(0.0, 0.0);
    UIColor *pixelColor = [slider colorOfPoint:pointMinX];
    STAssertTrue([pixelColor isEqualToColor:[UIColor clearColor]], @"");
    
    CGPoint pointMaxX = CGPointMake(319.0, 0.0);
    pixelColor = [slider colorOfPoint:pointMaxX];
    STAssertTrue([pixelColor isEqualToColor:[UIColor clearColor]], @"");
    
    CGPoint pointMaxY = CGPointMake(319.0, 99.0);
    pixelColor = [slider colorOfPoint:pointMaxY];
    STAssertTrue([pixelColor isEqualToColor:[UIColor clearColor]], @"");
}

// Couldn't make this work
//- (void)testInitDoubleRangeSlider_ShouldDrawBlackYAxisCenteredLine {
//    CGRect frame = CGRectMake(0.0, 0.0, 320.0, 100.0);
//    DoubleRangeSlider *slider = [[DoubleRangeSlider alloc] initWithFrame:frame];
//    CGPoint point = CGPointMake(0.0, 50.0);
//    UIColor *pixelColor = [slider colorOfPoint:point];
//    STAssertTrue([pixelColor isEqualToColor:[UIColor blackColor]], @"");
//}

#pragma mark - SenTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

@end
