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



@end
