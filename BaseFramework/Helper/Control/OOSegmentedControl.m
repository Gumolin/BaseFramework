//
//  ZPSegmentedControl.m
//  EduChat
//
//  Created by Beelin on 15/12/8.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "OOSegmentedControl.h"
#define IndexLineW 80

@interface OOSegmentedControl ()
@property (nonatomic,strong) UIView *indexLine;
@property (assign, nonatomic) CGFloat IndexLineX;
@property (nonatomic,strong) UIButton *selectBtn;
@end
@implementation OOSegmentedControl

+ (instancetype)segmentedControlWithFrame:(CGRect)frame Titles:(NSArray *)titles{
    OOSegmentedControl *control = [[OOSegmentedControl alloc] initWithFrame:frame];
    control.backgroundColor = [UIColor whiteColor];
    //setup
    [control setupUI:titles];
    return control;
}

/**
 *  文字
 **/
-(void)setupUI:(NSArray *)titles
{
    if (titles==nil) {
        return;
    }
    
    self.IndexLineX = self.bounds.size.width/titles.count/2-IndexLineW/2;
    
    for (int i = 0; i < titles.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.titleLabel.font = FontBody;
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:ColorContent forState:UIControlStateNormal];
        [btn setTitleColor:self.tintColor ? self.tintColor : ColorMain forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchDown];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.frame = CGRectMake(i*SCREEN_WIDTH/titles.count, 0, SCREEN_WIDTH/titles.count, self.bounds.size.height);
        [self addSubview:btn];
        
        if (i==0) {
            [self didSelect:btn];
        }
        
        
        //竖分隔线
        UIView *lineS = [[UIView alloc]init];
        lineS.frame = CGRectMake(self.bounds.size.width/titles.count*i , 5, 0.5,self.bounds.size.height-10);
        lineS.backgroundColor  = ColorSeparator;
        [self addSubview:lineS];
    }
    
    //下标线
    UIView *indexLine = [[UIView alloc]init];
    self.indexLine = indexLine;
    self.indexLine.frame = CGRectMake(self.IndexLineX, self.bounds.size.height-3,IndexLineW, 3);
    indexLine.backgroundColor  = self.tintColor ? self.tintColor : ColorMain;
    [self addSubview:indexLine];
    
    
    //横分隔线
    UIView *line = [[UIView alloc]init];
    line.frame = CGRectMake(0, self.bounds.size.height-0.5, self.bounds.size.width,0.5);
    line.backgroundColor  = ColorSeparator;
    [self addSubview:line];
    
}

-(void)didSelect:(UIButton*)sender
{
    self.selectBtn.selected = NO;
    sender.selected = YES;
    self.selectBtn = sender;
    
    [UIView animateWithDuration:.25 animations:^{
        [self.indexLine setX:CGRectGetMidX(sender.frame)-IndexLineW/2];
    }];
    
    //call back
    !self.clickButtonBlock ?: self.clickButtonBlock(sender.tag);
    //delegate
    if ([self.delegate respondsToSelector:@selector(segmentedControlIndexButtonView:lickBtnAtTag:)]) {
        [self.delegate segmentedControlIndexButtonView:self lickBtnAtTag:sender.tag];
    }
}


@end
