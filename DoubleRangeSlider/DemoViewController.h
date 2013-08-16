//
//  ViewController.h
//  DoubleRangeSlider
//
//  Created by raphaeloliveira on 8/15/13.
//  Copyright (c) 2013 Schibsted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController

@property (strong, nonatomic) NSArray *yearOptions;
@property (weak, nonatomic) IBOutlet UILabel *bedroomsLeftOption;
@property (weak, nonatomic) IBOutlet UILabel *bedroomsRightOption;
@property (weak, nonatomic) IBOutlet UILabel *yearLeftOption;
@property (weak, nonatomic) IBOutlet UILabel *yearRightOption;

@end
