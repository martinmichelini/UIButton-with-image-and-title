//
//  UIView+CustomSettings.h
//  App Delegate Test
//
//  Created by Martin Michelini on 4/25/16.
//  Copyright © 2016 Martin Michelini. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIView (CustomSettings)

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;

@end
