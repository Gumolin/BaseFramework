//
//  OOProgressHUD.h
//  MyFrame
//
//  Created by Gatlin on 16/9/8.
//  Copyright © 2016年 Gatlin. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface OOProgressHUD : MBProgressHUD

+ (OOProgressHUD *)showHUDAddedTo:(UIView *)view;

+ (instancetype )showText:(NSString *)text;
+ (instancetype )showText:(NSString *)text afterDelay:(float)time;

- (void)showText:(NSString *)text;
- (void)showText:(NSString *)text afterDelay:(float)time;
@end
