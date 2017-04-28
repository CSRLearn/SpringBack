//
//  SBBaseViewController.h
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/28.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBBaseViewController : UIViewController
@property(nonatomic, assign) CGFloat mtWdith;
@property(nonatomic, assign) CGFloat mtHeight;
+(UIButton *)hollowButtonWithBorderColor:(UIColor *) borderColor textColor:(UIColor* ) textColor textFont:(UIFont* ) font radius:(CGFloat) radius;
+(UIButton *)pureTextButtonWithTextColor:(UIColor* ) textColor textFont:(UIFont* ) font;
-(CGFloat)actualPxRltToWidthForPoint:(CGFloat ) ptW;
-(CGFloat)actualPxRltToHeightForPoint:(CGFloat ) ptH;
@end
