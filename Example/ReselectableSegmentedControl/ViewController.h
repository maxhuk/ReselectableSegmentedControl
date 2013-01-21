//
//  ViewController.h
//  ReselectableSegmentedControl
//
//  Created by Maksym Huk on 1/21/13.
//  Copyright (c) 2013 Maksym Huk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReselectableSegmentedControl.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet ReselectableSegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
