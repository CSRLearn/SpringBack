//
//  SpringBackFlowLayout.m
//  SpringBackDemo
//
//  Created by yaonphy on 17/4/27.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SpringBackFlowLayout.h"

@interface SpringBackFlowLayout ()
@property(nonatomic, assign) UIDynamicAnimator *sbAnimator;

@end

@implementation SpringBackFlowLayout

-(UIDynamicAnimator *)sbAnimator{
    
    if (_sbAnimator == nil) {
        _sbAnimator = [[UIDynamicAnimator alloc]initWithCollectionViewLayout:self];
    }
    
    return _sbAnimator;
}

-(void)prepareLayout{
    
}

@end
