//
//  FloatingButton.m
//  FloatingMenu
//
//  Created by Jeremy Petter on 2015-06-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "FloatingButton.h"
#import "UIColor+ExtraColors.h"

@implementation FloatingButton

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}


-(instancetype)initWithFrame:(CGRect)frame image:(UIImage*) image andBackgroundColor:(UIColor*) backgroundColor{
    self = [super initWithFrame:frame];
    if (self){
        [self setup];
        [self setImage:image forState:UIControlStateNormal];
        self.imageView.image = image;
        self.backgroundColor = backgroundColor;
    }
    return self;
}

- (void) setup {
    self.tintColor = [UIColor flatWhiteColor];
    self.backgroundColor = [UIColor flatBlueColor];
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.masksToBounds = YES;
    [self setBackgroundImage:[UIColor pixelImage]forState:UIControlStateHighlighted];
}

@end
