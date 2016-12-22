//
//  ThreeViewController.m
//  BaseFramework
//
//  Created by Gatlin on 16/10/17.
//  Copyright © 2016年 Mantis-man. All rights reserved.
//

#import "ThreeViewController.h"
#import "KxMenuItemViewController.h"
#import "ProgressHUDViewController.h"
#import "PhotoBrowserViewController.h"
#import "ImagePickerViewController.h"
@interface ThreeViewController ()
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSArray *arrayViewController;
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第三方Demo";
    
    _dataSource = @[NSStringFromClass([KxMenuItemViewController class]),
                    NSStringFromClass([ProgressHUDViewController class]),
                    NSStringFromClass([PhotoBrowserViewController class]),
                    NSStringFromClass([ImagePickerViewController class])];
    
    _arrayViewController = @[[[KxMenuItemViewController alloc] init],
                             [[ProgressHUDViewController alloc] init],
                            [[PhotoBrowserViewController alloc] init],
                             [[ImagePickerViewController alloc] init]];
    
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
