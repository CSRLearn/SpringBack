//
//  SBCircleController.m
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/5/1.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SBCircleController.h"
#import "SBCircleLayout.h"
#define CircleCollectionViewKeyKey @"CircleCollectionViewKeyKey"

@interface SBCircleController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UICollectionView *demoCltView;
@property(nonatomic, strong) SBCircleLayout* circleLayout;
@end

@implementation SBCircleController
-(SBCircleLayout *)circleLayout{

    if (_circleLayout == nil) {
        _circleLayout = [[SBCircleLayout alloc]init];
        
    }
    return _circleLayout;
}
-(UICollectionView *)demoCltView{
    
    if (_demoCltView == nil) {
        _demoCltView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:self.circleLayout];
        _demoCltView.backgroundColor = [UIColor lightTextColor];
        _demoCltView.delegate = self;
        _demoCltView.dataSource = self;
        [_demoCltView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CircleCollectionViewKeyKey];
    }
    return _demoCltView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cellCout = 20;
    [self.view addSubview:self.demoCltView];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    [self.demoCltView addGestureRecognizer:tapRecognizer];
    
    

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.cellCout;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 12.0f;
    }
    return 30.0f;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *) collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    UICollectionViewCell * curCell = [collectionView dequeueReusableCellWithReuseIdentifier:CircleCollectionViewKeyKey forIndexPath:indexPath];

    curCell.backgroundColor = [UIColor orangeColor];
    
    return curCell;
    
}
-(void)handleTapGesture:(UITapGestureRecognizer *) sender{
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint initializedPoit = [sender locationInView:self.demoCltView];
        NSIndexPath *tapedCellPath = [self.demoCltView indexPathForItemAtPoint:initializedPoit];
        if (tapedCellPath != nil) {
            self.cellCout -= 1;
            [self.demoCltView performBatchUpdates:^(void){
                [self.demoCltView deleteItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
        }else{
            self.cellCout += 1;
            [self.demoCltView performBatchUpdates:^(void){
                [self.demoCltView insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
