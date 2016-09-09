//
//  OOProgressHUD.m
//  MyFrame
//
//  Created by Gatlin on 16/9/8.
//  Copyright © 2016年 Gatlin. All rights reserved.
//

#import "OOProgressHUD.h"
static CGFloat const DefaultTime = 1.5;  //默认时间
@implementation OOProgressHUD

+ (OOProgressHUD *)showHUDAddedTo:(UIView *)view
{
    OOProgressHUD *hud = [super showHUDAddedTo:view animated:YES];
    hud.opacity = 0.65;
    hud.mode = MBProgressHUDModeIndeterminate;
    return hud;
}

+ (instancetype )showText:(NSString *)text
{
    return [self showText:text afterDelay:DefaultTime];
}

+ (instancetype )showText:(NSString *)text afterDelay:(float)time
{
    OOProgressHUD *hud = [[self alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
    hud.opacity = .65;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    
    [hud hide:YES afterDelay:time];
    return hud;
}


- (void)showText:(NSString *)text
{
    [self showText:text afterDelay:DefaultTime];
}
- (void)showText:(NSString *)text afterDelay:(float)time
{
    self.mode = MBProgressHUDModeText;
    self.labelText = text;
    
    [self hide:YES afterDelay:time];
}
@end
