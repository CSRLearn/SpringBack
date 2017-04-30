//
//  SBPinchLayout.m
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/30.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SBPinchLayout.h"

@interface SBPinchLayout ()


@end

@implementation SBPinchLayout
-(void)applyPinchToLayoutAttributes:(UICollectionViewLayoutAttributes *) layoutAttributes{
    
    if ([layoutAttributes.indexPath isEqual:self.pinchedCellPath]) {
        
        layoutAttributes.transform3D = CATransform3DMakeScale(self.pinchedCellScale, self.pinchedCellScale, 1.0f);
        layoutAttributes.center = self.pinchedCellCenter;
        layoutAttributes.zIndex = 1.0f;
    }
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    [self applyPinchToLayoutAttributes:attributes];
    return attributes;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect )rect{
    NSArray *allAttributesInRect = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *cellAttributes in allAttributesInRect) {
        [self applyPinchToLayoutAttributes:cellAttributes];
    }
    return allAttributesInRect;
}
-(void)setPinchedCellScale:(CGFloat) pinchedCellScale{
    _pinchedCellScale = pinchedCellScale;
    [self invalidateLayout];
}
-(void)setPinchedCellCenter:(CGPoint) pinchedCellCenter{
    _pinchedCellCenter = pinchedCellCenter;
    [self invalidateLayout];
}
@end
