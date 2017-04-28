//
//  UIColor+SBGenerator.m
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/28.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "UIColor+SBGenerator.h"

@implementation UIColor (SBGenerator)
+(UIColor *)colorWith0to255Red:(CGFloat )red green:(CGFloat) green blue:(CGFloat ) blue alpha:(CGFloat ) alpha
{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}
+(UIColor *)colorWithHEXRGB:(unsigned) hexRGB alpha:(CGFloat ) alpha
{
    return [self colorWith0to255Red:(CGFloat)((hexRGB & 0xFF0000) >> 16) green:(CGFloat)((hexRGB & 0xFF0000) >> 16) blue:(CGFloat)((hexRGB & 0xFF0000) >> 16) alpha:alpha];
}
+(UIColor *)common153Color{
    return [UIColor colorWith0to255Red:153.0f green:153.0f blue:153.0f alpha:1.0f];
}
+(UIColor *)common68Color{
    return [UIColor colorWith0to255Red:68.0f green:68.0f blue:68.0f alpha:1.0f];
}
+(UIColor *)common238Color{
    return [UIColor colorWith0to255Red:238.0f green:238.0f blue:238.0f alpha:1.0f];
}
@end
