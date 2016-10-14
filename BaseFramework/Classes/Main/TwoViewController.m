//
//  TwoViewController.m
//  BaseFramework
//
//  Created by Mantis-man on 16/1/16.
//  Copyright © 2016年 Mantis-man. All rights reserved.
//

#import "TwoViewController.h"
#import "OneViewController.h"
@interface TwoViewController()

@end

@implementation TwoViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
    
}


@end
