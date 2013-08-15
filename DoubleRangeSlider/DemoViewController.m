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
    CGRect frame = CGRectMake(0.0, 30.0, 320.0, 100.0);
    DoubleRangeSlider *slider = [[DoubleRangeSlider alloc] initWithFrame:frame];
    [self.view addSubview:slider];
}

@end
