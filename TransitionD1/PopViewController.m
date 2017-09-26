//
//  PopViewController.m
//  TransitionD1
//
//  Created by oxape on 16/10/15.
//  Copyright © 2016年 oxape. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController ()

@end

@implementation PopViewController

- (IBAction)popMe:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
