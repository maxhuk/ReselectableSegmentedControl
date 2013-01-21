//
//  ViewController.m
//  ReselectableSegmentedControl
//
//  Created by Maksym Huk on 1/21/13.
//  Copyright (c) 2013 Maksym Huk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int _count;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _count = 0;
    }
    return self;
}

- (void)updateLabel
{
    _label.text = [NSString stringWithFormat:@"%d", _count];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateLabel];
    [_segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)segmentedControlValueChanged:(id)sender
{
    NSInteger i = ((ReselectableSegmentedControl *)sender).selectedSegmentIndex;
    _count += (i + 1);
    [self updateLabel];
}

@end
