//
//  BaseViewController.m
//  UICollectionViewDemo
//
//  Created by 张海涛 on 2017/4/19.
//  Copyright © 2017年 张海涛. All rights reserved.
//

#import "BaseViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
@interface BaseViewController ()<UINavigationControllerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //光实现这行代码 可以滑动返回，但是在导航控制器的根控制器中使用滑动返回会导致界面卡死。所以我们要控制interactivePopGestureRecognizer这个手势的是否可用，在根控制器中不让使用，不是根控制器才能拿使用。
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
}

- (void)setLeftItemWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title{
    UIButton *leftItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftItemButton.frame = frame;
    if (imageName.length!=0) {
        [leftItemButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
    }else{
        [leftItemButton setTitle:title forState:UIControlStateNormal];
        leftItemButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
    }
    [leftItemButton addTarget:self action:@selector(leftItemButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftItemButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
- (void)leftItemButtonAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//不能是viewWillAppear  因为刚开始滑动的时候就会调用目的VC的viewWillAppear方法，直接将navgationVC的这个手势给禁止掉。
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.navigationController.viewControllers.count==1) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }else{
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
    NSLog(@"%@",self);
}


//新的隐藏navgationbar方法  使用代理方法  可以完美解决
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    BOOL isHiddenNavBar = [viewController isKindOfClass:[TwoViewController class]];
    [self.navigationController setNavigationBarHidden:isHiddenNavBar animated:YES];
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
