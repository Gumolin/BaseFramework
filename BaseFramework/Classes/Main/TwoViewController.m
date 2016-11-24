//
//  TwoViewController.m
//  BaseFramework
//
//  Created by Mantis-man on 16/1/16.
//  Copyright © 2016年 Mantis-man. All rights reserved.
//

#import "TwoViewController.h"
#import "OneViewController.h"
#import "ScrollMianViewController.h"
@interface TwoViewController()
@property (nonatomic, strong) NSArray *arrayName;
@property (nonatomic, strong) NSArray *arrayViewController;
@end

@implementation TwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _arrayName = @[NSStringFromClass([ScrollMianViewController class])];
    
    _arrayViewController = @[[[ScrollMianViewController alloc] init]
                            ];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - TableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.arrayName[indexPath.row];
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
