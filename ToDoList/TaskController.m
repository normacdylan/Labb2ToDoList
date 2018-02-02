//
//  TaskController.m
//  ToDoList
//
//  Created by August Posner on 2018-01-30.
//  Copyright © 2018 August Posner. All rights reserved.
//

#import "TaskController.h"
#import "DBHandler.h"

@interface TaskController ()
@property (weak, nonatomic) IBOutlet UITextField *titleEdit;
@property (weak, nonatomic) IBOutlet UITextField *specificationEdit;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISwitch *prioritySwitch;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation TaskController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleEdit.delegate = self;
    self.specificationEdit.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addTask {
    NSString *title = self.titleEdit.text;
    NSString *specification = self.specificationEdit.text;
    BOOL highPriority = self.prioritySwitch.isOn;
    NSDate *date = self.datePicker.date;
    
    [DBHandler addTaskWithTitle:title specification:specification highPriority:highPriority date:date];
}

- (IBAction)pressedAdd:(id)sender {
    [self addTask];
//    [self setReadOnly];
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) setReadOnly {
    [self.addButton setHidden:YES];
    [self.prioritySwitch setEnabled:NO];
    [self.titleEdit setEnabled:NO];
    [self.specificationEdit setEnabled:NO];
    [self.datePicker setEnabled:NO];
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
