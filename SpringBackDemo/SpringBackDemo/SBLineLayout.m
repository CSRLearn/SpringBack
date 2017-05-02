//
//  SBLineLayout.m
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/5/1.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SBLineLayout.h"

#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.3

@implementation SBLineLayout
-(instancetype)init{
    
    self = [super init];
    if (self) {
        
        self.itemSize = CGSizeMake(400, 600);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(200.0f, 0.0f, 200.0f, 0.0f);
        self.minimumLineSpacing = 50.0f;
    }
    
    return self;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect )rect{
    NSArray *allAttributesInRect = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes *cellAttributes in allAttributesInRect) {
        if (CGRectIntersectsRect(cellAttributes.frame, rect)) {
            CGFloat distance = CGRectGetMidX(visibleRect) - cellAttributes.center.x;
            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
            if (ABS(distance) < ACTIVE_DISTANCE) {
                CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
                cellAttributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0f);
                cellAttributes.zIndex = round(zoom);
            }
        }
        
    }
    return allAttributesInRect;
}
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{

    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds)/2.0f);
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0f, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray *array = [super layoutAttributesForElementsInRect:targetRect];
    for (UICollectionViewLayoutAttributes *cellAttributes in array) {
        CGFloat itemHorizontalCenter = cellAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

@end
