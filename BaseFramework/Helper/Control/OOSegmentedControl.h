//
//  DWDSegmentedControl.h
//  EduChat
//
//  Created by apple on 15/12/8.
//  Copyright © 2015年 dwd. All rights reserved.
//  选择按钮control

#import <UIKit/UIKit.h>

@class OOSegmentedControl;
@protocol OOSegmentedControlDelegate <NSObject>
-(void)segmentedControlIndexButtonView:(OOSegmentedControl *)indexButtonView lickBtn:(UIButton*)sender;
@end


@interface OOSegmentedControl : UIView

@property (nonatomic,strong) NSArray *arrayTitles;
@property (nonatomic,strong) UIButton *selectBtn;
@property (nonatomic,strong) UIView *indexLine;
@property (assign, nonatomic) CGFloat IndexLineX;
@property (nonatomic,weak) id<OOSegmentedControlDelegate> delegate;
@end
