//
//  SBBaseViewController.m
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/28.
//  Copyright © 2017年 YF. All rights reserved.
//


#import "SBBaseViewController.h"



#define MTStandardWPoint 375.0f
#define MTStandardHPoint 667.0f

@interface SBBaseViewController ()

@end

@implementation SBBaseViewController

+(UIButton *)hollowButtonWithBorderColor:(UIColor *) borderColor textColor:(UIColor* ) textColor textFont:(UIFont* ) font radius:(CGFloat) radius{
    UIButton *hollowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    hollowBtn.layer.masksToBounds = YES;
    hollowBtn.layer.borderWidth = 0.5f;
    hollowBtn.layer.cornerRadius = radius;
    hollowBtn.layer.borderColor = borderColor.CGColor;
    [hollowBtn setTitleColor:textColor forState:UIControlStateNormal];
    hollowBtn.titleLabel.font = font;
    return hollowBtn;
    
}
+(UIButton *)pureTextButtonWithTextColor:(UIColor* ) textColor textFont:(UIFont* ) font{
    UIButton *pureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pureBtn setTitleColor:textColor forState:UIControlStateNormal];
    pureBtn.titleLabel.font = font;
    return pureBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mtWdith = self.view.frame.size.width;
    self.mtHeight = self.view.frame.size.height;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}
-(CGFloat)actualPxRltToWidthForPoint:(CGFloat ) ptW{
    
    return (self.mtWdith * (ptW/MTStandardWPoint));
}
-(CGFloat)actualPxRltToHeightForPoint:(CGFloat ) ptH{
    return (self.mtHeight * (ptH/MTStandardHPoint));
}


@end
