//
//  ZPSegmentedControl.m
//  EduChat
//
//  Created by apple on 15/12/8.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "OOSegmentedControl.h"
#define IndexLineW 80

@implementation OOSegmentedControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



/**
 *  文字
 **/
-(void)setArrayTitles:(NSArray *)arrayTitles
{
    if (arrayTitles==nil) {
        return;
    }
    
    self.IndexLineX = self.bounds.size.width/arrayTitles.count/2-IndexLineW/2;
    
    for (int i = 0; i < arrayTitles.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.titleLabel.font = FontBody;
        [btn setTitle:arrayTitles[i] forState:UIControlStateNormal];
        [btn setTitleColor:ColorContent forState:UIControlStateNormal];
        [btn setTitleColor:ColorMain forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchDown];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.frame = CGRectMake(i*SCREEN_WIDTH/arrayTitles.count, 0, SCREEN_WIDTH/arrayTitles.count, self.bounds.size.height);
        [self addSubview:btn];
        
        if (i==0) {
            [self didSelect:btn];
        }
        
        
        //竖分隔线
        UIView *lineS = [[UIView alloc]init];
        lineS.frame = CGRectMake(self.bounds.size.width/arrayTitles.count*i , 5, 0.5,self.bounds.size.height-10);
        lineS.backgroundColor  = ColorSeparator;
        [self addSubview:lineS];
    }
    
    //下标线
    UIView *indexLine = [[UIView alloc]init];
    self.indexLine = indexLine;
    self.indexLine.frame = CGRectMake(self.IndexLineX, self.bounds.size.height-3,IndexLineW, 3);
    indexLine.backgroundColor  = ColorMain;
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
    
    if ([self.delegate respondsToSelector:@selector(segmentedControlIndexButtonView:lickBtn:)]) {
        [self.delegate segmentedControlIndexButtonView:self lickBtn:sender];
    }
}


@end
