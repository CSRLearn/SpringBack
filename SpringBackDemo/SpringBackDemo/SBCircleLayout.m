//
//  SBCircleLayout.m
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/5/1.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SBCircleLayout.h"
#define ITEM_SIZE 40

@implementation SBCircleLayout
-(void)prepareLayout{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    self.cellCout = [[self collectionView] numberOfItemsInSection:0];
    self.center = CGPointMake(size.width/2.0f, size.height/2.0f);
    self.radius = MIN(size.width, size.height) / 2.5f;
}
-(CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    attributes.center = CGPointMake(self.center.x + self.radius*cosf(2*indexPath.item*M_PI/self.cellCout), self.center.y + self.radius*sinf(2*indexPath.item*M_PI/self.cellCout));
    return attributes;
}
-(NSArray *)layoutAttributesForElementsInRect:(CGRect )rect{
    NSMutableArray *allAttributesInRect = [NSMutableArray array];
    for (NSInteger i = 0; i < self.cellCout; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [allAttributesInRect addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return allAttributesInRect;
}
-(UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    
    UICollectionViewLayoutAttributes *attributes  = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0f;
    attributes.center = CGPointMake(self.center.x, self.center.y);
    return attributes;
    
}
-(UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes *attributes  = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0f;
    attributes.center = CGPointMake(self.center.x, self.center.y);
    attributes.transform3D = CATransform3DMakeScale(0.1f, 0.1f, 1.0f);
    return attributes;
}
@end
