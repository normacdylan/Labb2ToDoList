//
//  Task.m
//  ToDoList
//
//  Created by August Posner on 2018-01-30.
//  Copyright © 2018 August Posner. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)initWithTitle:(NSString*)title specification:(NSString*) specification highPriority:(BOOL) highPriority date:(NSDate*) date;
{
    self = [super init];
    if (self) {
        self.title = title;
        self.specification = specification;
        self.highPriority = highPriority;
        self.finished = NO;
        self.date = date;
    }
    return self;
}
//onödig om dictionaryToTask är onödig
- (instancetype)initWithTitle:(NSString*)title specification:(NSString*) specification highPriority:(BOOL) highPriority finished:(BOOL)finished date:(NSDate*) date;
{
    self = [super init];
    if (self) {
        self.title = title;
        self.specification = specification;
        self.highPriority = highPriority;
        self.finished = finished;
        self.date = date;
    }
    return self;
}

- (NSDictionary*) taskToDictionary {
    NSDictionary *result = @{@"title":self.title, @"specification":self.specification, @"highPriority":[NSNumber numberWithBool:self.highPriority], @"finished":[NSNumber numberWithBool:self.finished], @"date":self.date};
    return result;
}


//Onödig?
+ (Task*) dictionaryToTask:(NSDictionary*) input {
    NSString *title = [input objectForKey:@"title"];
    NSString *specification = [input objectForKey:@"specification"];
    BOOL highPriority = (BOOL)[input objectForKey:@"highPriority"];
    BOOL finished = (BOOL)[input objectForKey:@"finished"];
    NSDate *date = [input objectForKey:@"date"];
    Task *task = [[Task alloc] initWithTitle:title specification:specification highPriority:highPriority finished:finished date:date];
    return task;
}


@end
