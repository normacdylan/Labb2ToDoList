//
//  DBHandler.m
//  ToDoList
//
//  Created by August Posner on 2018-02-01.
//  Copyright © 2018 August Posner. All rights reserved.
//

#import "DBHandler.h"
#import "Task.h"

@implementation DBHandler

- (NSDictionary*) getData:(BOOL)finished {
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    
    if (finished && [savedData objectForKey:@"finishedTasks"] != nil) {
        data = [savedData objectForKey:@"finishedTasks"];
        data = data.mutableCopy;
    } else if (!finished && [savedData objectForKey:@"unfinishedTasks"] != nil) {
        data = [savedData objectForKey:@"unfinishedTasks"];
        data = data.mutableCopy;
    }
    return data;
}

+ (void) addTaskWithTitle:(NSString*)title specification:(NSString*)specification highPriority:(BOOL)highPriority date:(NSDate*)date {
    
    Task *task = [[Task alloc] initWithTitle:title specification:specification highPriority:highPriority date:date];
    
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    NSMutableArray *data = [[NSMutableArray alloc] init];
    
    if ([savedData objectForKey:@"unfinishedTasks"] != nil) {
        data = [savedData objectForKey:@"unfinishedTasks"];
        data = data.mutableCopy;
    }
    
    NSDictionary *encodedTask = [task taskToDictionary];
    [data addObject:encodedTask];
    
    [savedData setObject:data forKey:@"unfinishedTasks"];
}

+ (void) deleteTask:(int)index finished:(BOOL)finished {
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    NSMutableArray *data = finished? [savedData objectForKey:@"finishedTasks"]:[savedData objectForKey:@"unfinishedTasks"];
    data = data.mutableCopy;
    [data removeObjectAtIndex:index];
    [savedData setObject:data forKey:finished? @"finishedTasks" : @"unfinishedTasks"];
}

+ (void) finishTask:(int)index {
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    NSMutableArray *data = [savedData objectForKey:@"unfinishedTasks"];
    data = data.mutableCopy;
    
    NSMutableDictionary *encodedTask = data[index];
    encodedTask = encodedTask.mutableCopy;
    [encodedTask setObject:[NSNumber numberWithBool:YES] forKey:@"finished"];
    
    [data removeObjectAtIndex:index];
    [savedData setObject:data forKey:@"unfinishedTasks"];
    
    if ([savedData objectForKey:@"finishedTasks"]!=nil) {
        data = [savedData objectForKey:@"finishedTasks"];
        data = data.mutableCopy;
    } else
        data = @[].mutableCopy;
    [data addObject:encodedTask];
    [savedData setObject:data forKey:@"finishedTasks"];
}

+ (NSDictionary*) loadTask:(int)index finished:(BOOL)finished {
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    NSArray *data = finished? [savedData objectForKey:@"finishedTasks"]:[savedData objectForKey:@"unfinishedTasks"];
    return data[index];
}

+ (NSMutableArray*) loadTasks:(BOOL)finished {
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    NSMutableArray *data = finished? [savedData objectForKey:@"finishedTasks"]:[savedData objectForKey:@"unfinishedTasks"];
    data = data.mutableCopy;
    return data;
}

@end
