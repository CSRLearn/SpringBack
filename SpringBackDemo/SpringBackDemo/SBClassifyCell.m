//
//  SBClassifyCell.m
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/28.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SBClassifyCell.h"
#import "UIColor+SBGenerator.h"

@implementation SBClassifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UILabel *)clsTitleLable{

    if (_clsTitleLable == nil) {
        _clsTitleLable = [[UILabel alloc]init];
        _clsTitleLable.font = [UIFont boldSystemFontOfSize:15.0f];
        _clsTitleLable.textColor = [UIColor common68Color];
    }
    return _clsTitleLable;
}
-(UILabel *)clsDescriptionLable{
    if (_clsDescriptionLable == nil) {
        _clsDescriptionLable = [[UILabel alloc]init];
        _clsDescriptionLable.font = [UIFont systemFontOfSize:13.0f];
        _clsDescriptionLable.textColor = [UIColor common153Color];
    }
    return _clsDescriptionLable;
}
-(UIView *)bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc]init];
        _bottomLine.backgroundColor = [UIColor common238Color];
    }
    return _bottomLine;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.clsTitleLable];
        [self.contentView addSubview:self.clsDescriptionLable];
        [self.contentView addSubview:self.bottomLine];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    SBClassifyCellLayout *curLayout = self.clsCellLayout;

    self.clsTitleLable.frame = CGRectMake(curLayout.clsHorLeftRightP, 0.0f, curLayout.clsLabelW , curLayout.clsTitleLableH);
    self.clsDescriptionLable.frame = CGRectMake(curLayout.clsHorLeftRightP, curLayout.clsTitleLableH, curLayout.clsLabelW, curLayout.clsDescriptionLableH);
    self.bottomLine.frame = CGRectMake(0.0f, curLayout.clsHeight - 0.5f, curLayout.clsWidth, 0.5f);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
