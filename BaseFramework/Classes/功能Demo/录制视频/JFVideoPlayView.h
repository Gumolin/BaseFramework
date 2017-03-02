//
//  OOVideoPlayView.h
//  BaseFramework
//
//  Created by Beelin on 17/2/22.
//  Copyright © 2017年 Mantis-man. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFVideoPlayView : UIView

/** 
 视频播放url
 */
@property (nonatomic, strong) NSURL *videoUrl;

/** 
 播放视频
 */
- (void)play;

/**
 停止播放视频
 */
- (void)pause;
@end
