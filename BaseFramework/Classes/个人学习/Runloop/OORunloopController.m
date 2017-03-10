//
//  OORunloopController.m
//  BaseFramework
//
//  Created by Beelin on 17/3/7.
//  Copyright © 2017年 Mantis-man. All rights reserved.
//

#import "OORunloopController.h"

@interface OORunloopController ()<UIScrollViewDelegate>
{
    CFRunLoopRef runloopRef;
    CFRunLoopSourceRef source;
    __weak NSArray *weakArray;
}
@end

@implementation OORunloopController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = [NSArray array];
    weakArray = array;
    
//    [self testDisPatch];
//    [self willWorkWithOutSource];
    [self inputSource];
}

- (void)willWorkWithOutSource {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        [self commonTimer];
//        [[NSRunLoop currentRunLoop] run];
        NSLog(@"1");
    });
}

- (void)testDisPatch {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"1");
//    });
    
        dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"1");
                });
    
}

- (void)testTimer{
    UIScrollView *myScroll = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    myScroll.contentSize = CGSizeMake(375, 10000);
    [self.view addSubview:myScroll];
    myScroll.backgroundColor = [UIColor redColor];
    myScroll.delegate = self;
    [self defalutTimer];//defalult mode 下的timer
    [self commonTimer];//common modes中的timer
    
}
- (void)defalutTimer {
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(doTime)
                                   userInfo:nil repeats:YES];//这个timer会默认加到default
}
- (void)commonTimer {
    NSTimer *timer =[NSTimer timerWithTimeInterval:5.0 target:self selector:@selector(doTime)
                                          userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)doTime {
    OOLog(@"%@",[NSRunLoop currentRunLoop].currentMode);
    OOLog(@"timer--");
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    OOLog(@"%@",[NSRunLoop currentRunLoop].currentMode);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%p",&weakArray);
    CFRunLoopSourceSignal(source);
    CFRunLoopWakeUp(runloopRef);
}

//配置基于端口的输入源
- (void)inputSource {
    //    NSPort *myPort = [NSMachPort port];
    //    [myPort setDelegate:self];//处理了port的传递
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //
    //        [[NSRunLoop currentRunLoop] addPort:myPort forMode:NSDefaultRunLoopMode];
    //        [[NSRunLoop currentRunLoop] run];
    //        NSLog(@"1");
    //    });
    ////    [TestMachPort getPortMessageWithPort:myPort];
    //
    ////    NSPortMessage * message1;
    //
    ////    NSLog(@"%@",MyBlock());
    //   static CFRunLoopRef a;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CFRunLoopSourceContext context = {0,NULL,NULL,NULL,NULL,NULL,NULL,&isadd,&isCancel,&perfor};
        runloopRef = CFRunLoopGetCurrent();
        source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
        CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
        
        NSInteger bb =  CFRunLoopRunInMode(  (__bridge CFStringRef)NSDefaultRunLoopMode, 3, YES) ;
        NSLog(@"%ld",bb);
        
        
        
    });
}
void isadd() {
    NSLog(@"add");
}
void isCancel (){
    NSLog(@"cancel");
}
void perfor () {
    NSLog(@"perform");
}
@end
