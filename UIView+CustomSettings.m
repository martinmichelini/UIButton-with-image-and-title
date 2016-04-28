//
//  UIView+CustomSettings.m
//  App Delegate Test
//
//  Created by Martin Michelini on 4/25/16.
//  Copyright © 2016 Martin Michelini. All rights reserved.
//


#import "UIView+CustomSettings.h"

@implementation UIView (CustomSettings)

@dynamic borderColor,borderWidth,cornerRadius;

-(void)setBorderColor:(UIColor *)borderColor{
    [self.layer setBorderColor:borderColor.CGColor];
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    [self.layer setBorderWidth:borderWidth];
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    [self.layer setCornerRadius:cornerRadius];
}

@end
