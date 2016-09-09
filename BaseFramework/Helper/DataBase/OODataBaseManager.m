//
//  DWDDataBaseHelper.m
//  EduChat
//
//  Created by KKK on 16/3/28.
//  Copyright © 2016年 dwd. All rights reserved.
//

#import "OODataBaseManager.h"
#import <FMDB.h>

@implementation OODataBaseManager
{
    FMDatabaseQueue* queue;
}


SingletonM(DataBaseManager);

- (instancetype)init {
    self = [super init];
    if(self){
        //数据库路径
//        queue = [FMDatabaseQueue databaseQueueWithPath:];
    }
    return self;
}


-(void) inDatabase:(void(^)(FMDatabase *db))block
{
    [queue inDatabase:^(FMDatabase *db){
        block(db);
    }];
}

- (void)beginTransactionInDatabase:(void (^)(FMDatabase *, BOOL *))block {
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        block(db, rollback);
    }];
}

-(void)resetDB {
    //数据库路径
//    queue = [FMDatabaseQueue databaseQueueWithPath:DWDDatabasePath];
}

@end
