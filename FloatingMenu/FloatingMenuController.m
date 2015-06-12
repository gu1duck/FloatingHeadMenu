//
//  FloatingMenuController.m
//  FloatingMenu
//
//  Created by Jeremy Petter on 2015-06-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "FloatingMenuController.h"
#import "FloatingButton.h"
#import "UIColor+ExtraColors.h"

typedef enum FloatingButtonDirection{up,left}FloatingButtonDirection;

@interface FloatingMenuController()

@property (weak, nonatomic) id delegate;
@property (nonatomic) FloatingButtonDirection defaultDirection;
@property (nonatomic) CGFloat buttonPadding;
@property (nonatomic) UIView* sender;
@property (nonatomic) UIVisualEffectView* blurView;

@end

@implementation FloatingMenuController

-(void)viewDidLoad{

    UIVisualEffectView* blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    self.blurView = blurView;
    [self.view addSubview:blurView];
    blurView.frame = self.view.frame;
    self.buttonPadding = 10;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self setupButtons];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(instancetype)initWithView:(UIView*) view{
    self = [super initWithNibName:nil bundle:nil];
    self.sender = view;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    return self;
}

-(void)dismissBlurView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)pressAButton:(id) sender{
    int ButtonIndex = (int)[self.buttonItems indexOfObject:sender];
    NSLog(@"You pressed button number %d", ButtonIndex);

}

-(void)setupButtons{
    FloatingButton* closeButton = [[FloatingButton alloc] initWithFrame: self.sender.frame image:[UIImage imageNamed:@"icon-close"] andBackgroundColor:[UIColor flatRedColor]];
    [closeButton addTarget:self action:@selector(dismissBlurView) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
    closeButton.transform = CGAffineTransformMakeRotation(-M_PI_2);

    
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        closeButton.transform = CGAffineTransformMakeRotation(0);
    } completion:nil];
    
    
    CGPoint buttonCenter = self.sender.center;

    float animationDelay = 0.00;
    NSString* buttonText = @"Label %d";
    int count = 1;
    
    for (FloatingButton* button in self.buttonItems){
        
        [self.view addSubview:button];
        [self.view sendSubviewToBack:button];
        [self.view sendSubviewToBack:self.blurView];
        button.transform = CGAffineTransformMakeRotation(-M_PI);
        button.alpha = 0.0;
        
        [button addTarget:self action:@selector(pressAButton:) forControlEvents:UIControlEventTouchUpInside];
        buttonCenter.y -= (50 + self.buttonPadding);
        
        UILabel* buttonLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.view addSubview:buttonLabel];
        buttonLabel.text = [NSString stringWithFormat:buttonText, count];
        count++;
        
        [buttonLabel sizeToFit];
        CGRect frame = buttonLabel.frame;
        frame.size.width += 10;
        frame.size.height += 10;
        buttonLabel.frame = frame;
        
        buttonLabel.textColor = [UIColor flatWhiteColor];
        buttonLabel.backgroundColor = [UIColor colorWithRed:0.9274 green:0.9436 blue:0.95 alpha:0.3];
        buttonLabel.textAlignment = NSTextAlignmentCenter;
        
        buttonLabel.clipsToBounds = YES;
        buttonLabel.layer.cornerRadius = 5;
        
        CGPoint labelCenter;
        labelCenter.y = button.center.y + self.buttonPadding + buttonLabel.frame.size.width/2 + button.frame.size.width/2;;
        labelCenter.x = button.center.x;
        buttonLabel.center = labelCenter;
        
        buttonLabel.transform = CGAffineTransformMakeRotation(-M_PI_2);
        buttonLabel.alpha = 0.0;

        
        [UIView animateWithDuration:0.3 delay:animationDelay usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            button.center = buttonCenter;
            button.transform = CGAffineTransformMakeRotation(0);
            button.alpha = 1.0;
            
            CGPoint labelDestination;
            labelDestination.y = button.center.y;
            labelDestination.x = button.center.x - self.buttonPadding - buttonLabel.frame.size.height/2 - button.frame.size.width/2;
            buttonLabel.center = labelDestination;
            buttonLabel.transform = CGAffineTransformMakeRotation(0);
            buttonLabel.alpha = 1.0;
            
        } completion:nil];
        animationDelay += 0.03;
    }
}



@end
