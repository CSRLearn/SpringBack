//
//  SBClassifyController.m
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/28.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SBClassifyController.h"
#import "SBClassifyModel.h"
#import "SBClassifyCell.h"
#import "SBClassifyCellLayout.h"
#import "SBBaseCollectionController.h"
#import "SBCircleController.h"

@interface SBClassifyController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *clsListTableView;
@property(nonatomic, strong) NSMutableArray<SBClassifyModel*> *clsMutDataArray;
@property(nonatomic, strong) SBClassifyCellLayout *defaultClsCellLayout;

@end

@implementation SBClassifyController

-(NSMutableArray<SBClassifyModel *> *)clsMutDataArray{

    if (_clsMutDataArray == nil) {
        _clsMutDataArray = [[NSMutableArray alloc]init];
        
        SBClassifyModel *basicMole = [[SBClassifyModel alloc]init];
        basicMole.clsTitle = @"CollectionView 基础";
        basicMole.clsDescription = @"CollectionView Prototype";
        
        [_clsMutDataArray addObject:basicMole];
        
        SBClassifyModel *circleMole = [[SBClassifyModel alloc]init];
        circleMole.clsTitle = @"Circle CollectionView";
        circleMole.clsDescription = @"CollectionView animation";
        
        [_clsMutDataArray addObject:circleMole];
    }
    
    return _clsMutDataArray;
    
}
-(SBClassifyCellLayout *)defaultClsCellLayout{
    if (_defaultClsCellLayout == nil) {
        _defaultClsCellLayout = [[SBClassifyCellLayout alloc]init];
        _defaultClsCellLayout.clsWidth = self.mtWdith;
        _defaultClsCellLayout.clsHeight = 60.f;
        _defaultClsCellLayout.clsHorLeftRightP = 15.0f;
        _defaultClsCellLayout.clsLabelW = _defaultClsCellLayout.clsWidth - _defaultClsCellLayout.clsHorLeftRightP*2;
        _defaultClsCellLayout.clsTitleLableH = 35.0f;
        _defaultClsCellLayout.clsDescriptionLableH = 20.0f;

    }
    return _defaultClsCellLayout;
}
-(void)initClsTableView{
    
    self.clsListTableView = [[UITableView alloc]init];
    self.clsListTableView.frame = CGRectMake(0, 0, self.mtWdith, self.mtHeight);
    self.clsListTableView.backgroundColor = [UIColor whiteColor];
    self.clsListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.clsListTableView.dataSource = self;
    self.clsListTableView.delegate = self;
    
    [self.view addSubview:self.clsListTableView];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"UICollectionView";

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.title = @"";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initClsTableView];

    [self.clsListTableView reloadData];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.defaultClsCellLayout.clsHeight;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.clsMutDataArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * clsListID= @"SbclsListID";
    
    SBClassifyCell *clsCell = [tableView dequeueReusableCellWithIdentifier:clsListID];
    if (clsCell == nil) {
        clsCell = [[SBClassifyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:clsListID];
        
    }
    clsCell.clsCellLayout = self.defaultClsCellLayout;
    SBClassifyModel *curModel = [self.clsMutDataArray objectAtIndex:indexPath.row];
    clsCell.clsTitleLable.text = curModel.clsTitle;
    clsCell.clsDescriptionLable.text = curModel.clsDescription;
    return clsCell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SBClassifyModel *curModel = [self.clsMutDataArray objectAtIndex:indexPath.row];
    
    switch (indexPath.row) {
        case 0:
        {
            SBBaseCollectionController *baseClsCtr = [[SBBaseCollectionController alloc]init];
            baseClsCtr.title = curModel.clsTitle;
            [self.navigationController pushViewController:baseClsCtr animated:YES];
        }
            break;
            
        case 1:
        {
            SBCircleController *circleClsCtr = [[SBCircleController alloc]init];
            circleClsCtr.title = curModel.clsTitle;
            [self.navigationController pushViewController:circleClsCtr animated:YES];
        }
            break;
        default:
            break;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
