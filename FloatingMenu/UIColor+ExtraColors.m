//
//  UIColor+ExtraColors.m
//  FloatingMenu
//
//  Created by Jeremy Petter on 2015-06-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "UIColor+ExtraColors.h"

@implementation UIColor (ExtraColors)

+ (UIColor*) flatWhiteColor{
    return [UIColor colorWithRed:0.9274 green:0.9436 blue:0.95 alpha:1.0];
}

+ (UIColor*) flatBlackColor{
    return [UIColor colorWithRed:0.1674 green:0.1674 blue:0.1674 alpha:1.0];
}

+ (UIColor*) flatBlueColor{
    return [UIColor colorWithRed:0.3132 green:0.3974 blue:0.6365 alpha:1.0];
}

+ (UIColor*) flatRedColor{
    return [UIColor colorWithRed:0.9115 green:0.2994 blue:0.2335 alpha:1.0];
}

+ (UIImage*) pixelImage{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 2.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor flatBlackColor] CGColor]);
    CGContextFillRect(context, rect);
    return UIGraphicsGetImageFromCurrentImageContext();
}



@end
