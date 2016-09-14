//
//  OneViewController.m
//  BaseFramework
//
//  Created by Mantis-man on 16/1/16.
//  Copyright © 2016年 Mantis-man. All rights reserved.
//

#import "OneViewController.h"
#import "OneSubViewController.h"
@implementation OneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(100, 100, 30, 30);
    [btn addTarget: self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   //test
}

- (void)pushVC
{
    OneSubViewController *sub = [[OneSubViewController alloc]init];
    sub.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:sub animated:YES];

}
@end
