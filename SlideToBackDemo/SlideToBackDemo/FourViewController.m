//
//  FourViewController.m
//  SlideToBackDemo
//
//  Created by zhanghaitao on 2017/12/22.
//  Copyright © 2017年 zhanghaitao. All rights reserved.
//

#import "FourViewController.h"
#import "FiveViewController.h"
@interface FourViewController ()<UINavigationControllerDelegate>

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"four";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setLeftItemWithFrame:CGRectMake(0, 0, 40, 30) withImageName:@"" withTitle:@"返回"];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 300);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"next" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonAction{
    FiveViewController *fiveVC = [[FiveViewController alloc] init];
    [self.navigationController pushViewController:fiveVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
    NSLog(@"%@",self);
}


//新的隐藏navgationbar方法  使用代理方法  可以完美解决
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    BOOL isHiddenNavBar = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isHiddenNavBar animated:YES];
}

-(void)dealloc{
    self.navigationController.delegate = self;
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
