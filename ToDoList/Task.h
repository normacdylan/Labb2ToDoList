//
//  Task.h
//  ToDoList
//
//  Created by August Posner on 2018-01-30.
//  Copyright © 2018 August Posner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *specification;
@property (nonatomic) NSDate *date;
@property (nonatomic) BOOL highPriority;
@property (nonatomic) BOOL finished;

- (instancetype)initWithTitle:(NSString*)title specification:(NSString*) specification highPriority:(BOOL) highPriority date:(NSDate*) date;
- (NSDictionary*) taskToDictionary;
+ (Task*) dictionaryToTask:(NSDictionary*) input;
@end
