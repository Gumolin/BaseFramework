//
//  ScrollMianViewController.m
//  BaseFramework
//
//  Created by Gatlin on 16/10/27.
//  Copyright © 2016年 Mantis-man. All rights reserved.
//

#import "ScrollMianViewController.h"

#import "ScrollSubOneViewController.h"
#import "ScrollSubTwoViewController.h"
#import "ScrollSubThreeViewController.h"

#import "OOSegmentedControl.h"
@interface ScrollMianViewController ()
@property (nonatomic, strong) UIViewController *currentVC;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *vc_array;
@end

@implementation ScrollMianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:({
        OOSegmentedControl *segment = [OOSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) Titles:@[@"1",@"2",@"3"]];
        __weak typeof(self) weakSelf = self;
        [segment setClickButtonBlock:^(NSInteger tag) {
            [weakSelf switchViewController:tag];
        }];
        segment;
    })];
    
    _vc_array = @[[[ScrollSubOneViewController alloc] init],
                            [[ScrollSubTwoViewController alloc] init],
                            [[ScrollSubThreeViewController alloc] init]];
    for (int i = 0; i < _vc_array.count; i ++) {
        [self initChildViewControllerWithIndex:i];
    }

    self.scrollView.contentSize = CGSizeMake(_vc_array.count * SCREEN_WIDTH, SCREEN_HEIGHT - 40);
    [self.view addSubview:self.scrollView];
   
    
}

/** 初始化 */
- (void)initChildViewControllerWithIndex:(int)index{
    UIViewController *vc = _vc_array[index];
    vc.view.frame = CGRectMake(index * SCREEN_WIDTH, 40, SCREEN_WIDTH, SCREEN_HEIGHT - 40);
    [self.scrollView addSubview:vc.view];
    
//    if ([vc isKindOfClass:[ScrollSubOneViewController class]]) {
//        _currentVC = vc;
//        [self.view addSubview:_currentVC.view];
//    }
  
}

#pragma mark - Getter
- (UIScrollView *)scrollView{
    if (!_scrollView) {
         _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT - 40)];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

/** 切换 */
- (void)switchViewController:(NSInteger)tag{
    _currentVC = nil;
    UIViewController *vc = self.childViewControllers[tag];
    _currentVC = vc;
    [self.view addSubview:_currentVC.view];
}


@end
