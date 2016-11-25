//
//  OOMyStudyViewController.m
//  BaseFramework
//
//  Created by Beelin on 16/11/24.
//  Copyright © 2016年 Mantis-man. All rights reserved.
//

#import "OOMyStudyViewController.h"
#import "OOCoreGraphicsViewController.h"

@interface OOMyStudyViewController ()
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSArray *arrayViewController;
@end

@implementation OOMyStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人学习";
    
    _dataSource = @[NSStringFromClass([OOCoreGraphicsViewController class])
                    ];
    
    _arrayViewController = @[[[OOCoreGraphicsViewController alloc] init]
                             ];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = self.arrayViewController[indexPath.row];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.arrayViewController[indexPath.row] animated:YES];
}


@end
