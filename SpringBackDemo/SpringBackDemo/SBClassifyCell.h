//
//  SBClassifyCell.h
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/28.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBClassifyCellLayout.h"

@interface SBClassifyCell : UITableViewCell
@property(nonatomic, strong) UILabel *clsTitleLable;
@property(nonatomic, strong) UILabel *clsDescriptionLable;
@property(nonatomic, strong) UIView *bottomLine;

@property(nonatomic, strong) SBClassifyCellLayout *clsCellLayout;

@end
