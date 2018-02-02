//
//  DetailViewController.m
//  ToDoList
//
//  Created by August Posner on 2018-02-01.
//  Copyright © 2018 August Posner. All rights reserved.
//

#import "DetailViewController.h"
#import "DBHandler.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *specificationText;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setup {
    NSDictionary *task = [DBHandler loadTask:self.taskIndex finished:self.finishedTask];
    
    self.titleLabel.text = [[task objectForKey:@"highPriority"] boolValue]==NO?
    [task objectForKey:@"title"] :
    [[task objectForKey:@"title"] stringByAppendingString:@" [Prio]"];
    
    self.specificationText.text = [task objectForKey:@"specification"];
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [df stringFromDate:[task objectForKey:@"date"]];
    NSString *deadLine = [@"Deadline: " stringByAppendingString: dateString];
    
    self.dateLabel.text = deadLine;
    
    self.doneButton.enabled = !self.finishedTask;
}
- (IBAction)pressedDone:(id)sender {
    [DBHandler finishTask:self.taskIndex];
    self.doneButton.enabled = NO;
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
