//
//  SBPinchLayout.h
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/30.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBPinchLayout : UICollectionViewFlowLayout
@property(nonatomic, strong) NSIndexPath *pinchedCellPath;
@property(nonatomic, assign) CGFloat pinchedCellScale;
@property(nonatomic, assign) CGPoint pinchedCellCenter;
@end
