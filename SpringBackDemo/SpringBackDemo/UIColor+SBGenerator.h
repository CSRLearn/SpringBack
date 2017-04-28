//
//  UIColor+SBGenerator.h
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/28.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SBGenerator)

+(UIColor *)colorWith0to255Red:(CGFloat )red green:(CGFloat) green blue:(CGFloat ) blue alpha:(CGFloat ) alpha;
+(UIColor *)colorWithHEXRGB:(unsigned) hexRGB alpha:(CGFloat ) alpha;
+(UIColor *)common153Color;
+(UIColor *)common68Color;
+(UIColor *)common238Color;
@end
