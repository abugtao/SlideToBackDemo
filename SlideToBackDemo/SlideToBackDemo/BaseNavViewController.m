//
//  BaseNavViewController.m
//  UICollectionViewDemo
//
//  Created by 张海涛 on 2016/11/22.
//  Copyright © 2016年 张海涛. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //iOS 7 之后，setTranslucent=yes 默认的   则状态栏及导航栏底部为透明的，界面上的组件应该从屏幕顶部开始显示，因为是半透明的，可以看到，所以为了不和状态栏及导航栏重叠，第一个组件的y应该从44+20的位置算起   如果设置成no，则状态栏及导航样不为透明的，界面上的组件就是紧挨着导航栏显示了，所以就不需要让第一个组件在y方向偏离44+20的高度了。   但是当使用了 setBackgroundImage： forBarMetrics：方法后就不用在乎这个属性了。 图片好像会占用一定的高度
    self.navigationBar.translucent = NO;
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation"] forBarMetrics:UIBarMetricsDefault];
    // 调用系统的界面 例如相册 通讯录的时候设置 navigationItem里面的字体颜色
//    self.navigationBar.tintColor =  [UIColor greenColor];
    
    
    //控制颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    
    
    //设置nav上字体的颜色。
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
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
