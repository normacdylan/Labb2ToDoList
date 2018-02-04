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
    
    self.titleLabel.text = [task objectForKey:@"titleAndPrio"];
    
    self.specificationText.text = [task objectForKey:@"specification"];
    
    self.dateLabel.text = [task objectForKey:@"deadline"];
    
    self.doneButton.enabled = !self.finishedTask;
}
- (IBAction)pressedDone:(id)sender {
    [DBHandler finishTask:self.taskIndex];
    [self.navigationController popViewControllerAnimated:YES];
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
