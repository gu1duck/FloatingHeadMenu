//
//  ViewController.m
//  FloatingMenu
//
//  Created by Jeremy Petter on 2015-06-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "ViewController.h"
#include "FloatingMenuController.h"
#import "FloatingButton.h"
#import "UIColor+ExtraColors.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showMenu:(id)sender {
    FloatingButton* senderButton = sender;
    CGRect buttonDefault = senderButton.frame;
    FloatingMenuController* floatingMenuControlelr = [[FloatingMenuController alloc] initWithView:senderButton];
    floatingMenuControlelr.buttonItems = @[
                                           [[FloatingButton alloc] initWithFrame:buttonDefault image:[UIImage imageNamed:@"icon-add"] andBackgroundColor:[UIColor flatBlueColor]],
                                           [[FloatingButton alloc] initWithFrame:buttonDefault image:[UIImage imageNamed:@"model-004"] andBackgroundColor:[UIColor flatBlueColor]],
                                           [[FloatingButton alloc] initWithFrame:buttonDefault image:[UIImage imageNamed:@"model-005"] andBackgroundColor:[UIColor flatBlueColor]],
                                           [[FloatingButton alloc] initWithFrame:buttonDefault image:[UIImage imageNamed:@"model-006"] andBackgroundColor:[UIColor flatBlueColor]],
                                           [[FloatingButton alloc] initWithFrame:buttonDefault image:[UIImage imageNamed:@"model-007"] andBackgroundColor:[UIColor flatBlueColor]],
                                           ];
    [self presentViewController:floatingMenuControlelr animated:YES completion:nil];
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        senderButton.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:nil];
}

@end
