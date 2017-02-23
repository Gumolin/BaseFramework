//
//  OOTextFiledCustomController.m
//  BaseFramework
//
//  Created by Beelin on 17/2/17.
//  Copyright © 2017年 Mantis-man. All rights reserved.
//

#import "OOTextFiledCustomController.h"

@interface OOTextFiledCustomController ()

@end

@implementation OOTextFiledCustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [self.view addSubview:tf];
}



@end
