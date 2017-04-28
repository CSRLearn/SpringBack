//
//  SBRootViewController.m
//  SpringBackDemo
//
//  Created by yaongfeng on 2017/4/28.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SBRootViewController.h"
#import "SBClassifyController.h"

@interface SBRootViewController ()
@property(nonatomic, strong)SBClassifyController *clsCtr;
@property(nonatomic, strong)UINavigationController *navCtr;

@end

@implementation SBRootViewController
+(instancetype)defaultRootController{
    static dispatch_once_t pred;
    static SBRootViewController *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[SBRootViewController alloc]init];
    });
    return shared;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.clsCtr = [[SBClassifyController alloc]init];
    self.navCtr = [[UINavigationController alloc]initWithRootViewController:self.clsCtr];
    
    [self.view addSubview:self.navCtr.view];
    [self addChildViewController:self.navCtr];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
