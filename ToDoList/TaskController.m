//
//  TaskController.m
//  ToDoList
//
//  Created by August Posner on 2018-01-30.
//  Copyright © 2018 August Posner. All rights reserved.
//

#import "TaskController.h"
#import "Task.h"

@interface TaskController ()
@property (weak, nonatomic) IBOutlet UITextField *titleEdit;
@property (weak, nonatomic) IBOutlet UITextView *specificationEdit;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISwitch *prioritySwitch;

@end

@implementation TaskController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Task*) createTask {
    NSString *title = self.titleEdit.text;
    NSString *specification = self.specificationEdit.text;
    BOOL highPriority = self.prioritySwitch.isOn;
    NSDate *date = self.datePicker.date;
    Task *task = [[Task alloc] initWithTitle:title specification:specification highPriority:highPriority date:date];
    return task;
}

- (void) saveTask:(Task*) task{
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    NSMutableArray *data = [[NSMutableArray alloc] init];
 //   if ([savedData objectForKey:@"savedData"] != nil)
 //       data = [savedData objectForKey:@"savedData"];
    [data addObject:task];
    [savedData setObject:data forKey:@"savedData"];
    [savedData synchronize];
}

- (IBAction)pressedAdd:(id)sender {
    Task *task = [self createTask];
    [self saveTask:task];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
