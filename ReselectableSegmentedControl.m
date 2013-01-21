//
//  ReselectableSegmentedControl.m
//  ReselectableSegmentedControl
//
//  Created by Maksym Huk on 1/21/13.
//  Copyright (c) 2013 Maksym Huk. All rights reserved.
//

#import "ReselectableSegmentedControl.h"

@implementation ReselectableSegmentedControl
{
    UIButton *_overlayButton;
}

- (void)initOverlayButton
{
    _overlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _overlayButton.backgroundColor = [UIColor clearColor];
    [_overlayButton addTarget:self action:@selector(overlayTapped:) forControlEvents:UIControlEventTouchUpInside];   
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initOverlayButton];
        [self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (void)dealloc
{
    [_overlayButton removeFromSuperview];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_overlayButton removeFromSuperview];
    [self.superview addSubview:_overlayButton];
    [self valueChanged:self];
}

- (void)valueChanged:(id)sender
{
    NSInteger si = self.selectedSegmentIndex;
    
    CGFloat x = 0;
    for (int i = 0; i < si; ++i) {
        x += [self widthForSegmentAtIndex:i];
    }
    
    CGRect rect = CGRectMake(x, 0, [self widthForSegmentAtIndex:si], self.bounds.size.height);
    _overlayButton.frame = [self convertRect:rect toView:self.superview];
    [self bringSubviewToFront:_overlayButton];
}

- (void)overlayTapped:(id)sender
{
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
