//
//  OOOperationQueuesController.m
//  BaseFramework
//
//  Created by Beelin on 17/2/16.
//  Copyright © 2017年 Mantis-man. All rights reserved.
//

#import "OOOperationQueuesController.h"

@interface OOOperationQueuesController ()

@end

@implementation OOOperationQueuesController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self start];
    [self operationQueue];
}

- (NSInvocationOperation *)invocationOperation{
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doSomething) object:nil];
    return operation;
}

/*
 注意:只要NSBlockOperation封装的操作数 > 1,就会异步执行操作 
 */
- (NSBlockOperation *)blockOperation{
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        [self doSomething];
    }];
    [operation addExecutionBlock:^{
        [self doSomething];
    }];
    return operation;
}


/*
 操作对象默认在主线程中执行，只有添加到队列中才会开启新的线程。即默认情况下，如果操作没有放到队列中queue中，都是同步执行
 */
- (void)start{
    [[self invocationOperation] start];
    [[self blockOperation] start];
}
/*
 NSOperationQueue的作⽤：NSOperation可以调⽤start⽅法来执⾏任务,但默认是同步执行的
 如果将NSOperation添加到NSOperationQueue(操作队列)中,系统会自动异步执行NSOperation中的操作
 添加操作到NSOperationQueue中，自动执行操作，自动开启线程
 */
- (void)operationQueue{
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    [q addOperation:[self invocationOperation]];
    [q addOperation:[self blockOperation]];
}


- (void)doSomething{
    NSLog(@"Start executing %@ with, mainThread: %@, currentThread: %@", NSStringFromSelector(_cmd), [NSThread mainThread], [NSThread currentThread]);
    sleep(3);
}
@end
