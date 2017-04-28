//
//  ViewController.m
//  SpringBackDemo
//
//  Created by yaonphy on 17/4/27.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SBBaseCollectionController.h"


#define DemoCollectionViewKeyKey @"DemoCollectionViewKeyKey"

@interface SBBaseCollectionController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UICollectionView *demoCltView;
@property(nonatomic, strong) UICollectionViewFlowLayout* demoFlowLayout;
@end

@implementation SBBaseCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.demoCltView];
    
}
-(UICollectionViewFlowLayout *)demoFlowLayout{
    
    if (_demoFlowLayout == nil) {
        _demoFlowLayout = [[UICollectionViewFlowLayout alloc]init];
        _demoFlowLayout.itemSize = CGSizeMake(60.f, 60.0f);
        _demoFlowLayout.minimumLineSpacing = 10.0f;
        _demoFlowLayout.minimumInteritemSpacing = 12.0f;
        _demoFlowLayout.sectionInset = UIEdgeInsetsMake(10.0f, 15.0f, 10.0f, 15.0f);
    }
    return _demoFlowLayout;
}
-(UICollectionView *)demoCltView{

    if (_demoCltView == nil) {
        _demoCltView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:self.demoFlowLayout];
        _demoCltView.backgroundColor = [UIColor lightGrayColor];
        _demoCltView.delegate = self;
        _demoCltView.dataSource = self;
        [_demoCltView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:DemoCollectionViewKeyKey];
    }
    return _demoCltView;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 6;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 14;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row%2 == 0) {
        return CGSizeMake(60.f, 60.0f);
    }else{
        return CGSizeMake(100.f, 50.0f);

    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 12.0f;
    }
    return 30.0f;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *) collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    UICollectionViewCell * curCell = [collectionView dequeueReusableCellWithReuseIdentifier:DemoCollectionViewKeyKey forIndexPath:indexPath];
    if (indexPath.row%2 == 0) {
        if (indexPath.section == 0) {
            curCell.backgroundColor = [UIColor greenColor];

        }else{
            curCell.backgroundColor = [UIColor orangeColor];
        }
    }else{
        if (indexPath.section == 0) {
            curCell.backgroundColor = [UIColor orangeColor];

        }else{
            curCell.backgroundColor = [UIColor greenColor];

        }
    }
    return curCell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
