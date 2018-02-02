//
//  DBHandler.h
//  ToDoList
//
//  Created by August Posner on 2018-02-01.
//  Copyright © 2018 August Posner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBHandler : NSObject

+ (void) addTaskWithTitle:(NSString*)title specification:(NSString*)specification highPriority:(BOOL)highPriority date:(NSDate*)date;

+ (NSDictionary*) loadTask:(int)index finished:(BOOL)finished ;

+ (NSMutableArray*) loadTasks:(BOOL)finished;

+ (void) deleteTask:(int)index finished:(BOOL)finished;

+ (void) finishTask:(int)index;

@end
