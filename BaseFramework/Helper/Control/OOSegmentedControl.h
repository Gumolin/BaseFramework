//
//  DWDSegmentedControl.h
//  EduChat
//
//  Created by Beelin on 15/12/8.
//  Copyright © 2015年 dwd. All rights reserved.
//  选择按钮control

#import <UIKit/UIKit.h>

@class OOSegmentedControl;
@protocol OOSegmentedControlDelegate <NSObject>
-(void)segmentedControlIndexButtonView:(OOSegmentedControl *)indexButtonView lickBtnAtTag:(NSInteger)tag;
@end


@interface OOSegmentedControl : UIView
+ (instancetype)segmentedControlWithFrame:(CGRect)frame Titles:(NSArray *)titles;
@property (nonatomic, strong) UIColor *tintColor;

/** 提供block 与 delegate,选择一种即可 */
@property (nonatomic, copy) void(^clickButtonBlock)(NSInteger tag);
@property (nonatomic,weak) id<OOSegmentedControlDelegate> delegate;
@end
