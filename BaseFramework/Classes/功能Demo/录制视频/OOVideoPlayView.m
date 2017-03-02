//
//  OOVideoPlayView.m
//  BaseFramework
//
//  Created by Beelin on 17/2/22.
//  Copyright © 2017年 Mantis-man. All rights reserved.
//

#import "OOVideoPlayView.h"

#import <AVFoundation/AVFoundation.h>

@interface OOVideoPlayView ()
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@end

@implementation OOVideoPlayView

#pragma mark - life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playbackFinished:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object:nil];
    }
    return self;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                  object:nil];
}

#pragma mark - Notification Implementation
- (void)playbackFinished:(NSNotification *)notification{
    if (notification.object == _playerItem) {
        [_player seekToTime:kCMTimeZero];
        [_player play];
    }
}
#pragma mark - Public Method
- (void)play{
    [_player play];
}

- (void)pause{
    _playerItem = nil;
    [_player pause];
    _player = nil;
    [_playerLayer removeFromSuperlayer];
    _playerLayer = nil;
}

#pragma mark - Setter
- (void)setVideoUrl:(NSURL *)videoUrl{
    _videoUrl = videoUrl;
   
    [self.layer addSublayer:self.playerLayer];
}

#pragma mark - Getter
- (AVPlayer *)player{
    if (!_player) {
        _player = [AVPlayer playerWithPlayerItem:self.playerItem];
    }
    return _player;
}

- (AVPlayerItem *)playerItem{
    if (!_playerItem) {
        _playerItem = [AVPlayerItem playerItemWithURL:self.videoUrl];
    }
    return _playerItem;
}

- (AVPlayerLayer *)playerLayer{
    if (!_playerLayer) {
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer.frame = self.frame;
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    }
    return _playerLayer;
}
@end
