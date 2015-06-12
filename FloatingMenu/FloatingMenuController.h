//
//  FloatingMenuController.h
//  FloatingMenu
//
//  Created by Jeremy Petter on 2015-06-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FloatingMenuController : UIViewController

@property (nonatomic) UIView* fromView;

-(instancetype)initWithView:(UIView*) view;
-(void)pressAButton:(id) sender;
@property (nonatomic) NSArray* buttonItems;



@end
