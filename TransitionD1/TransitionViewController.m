//
//  TransitionViewController.m
//  TransitionD1
//
//  Created by oxape on 16/10/22.
//  Copyright © 2016年 oxape. All rights reserved.
//

#import "TransitionViewController.h"
#import "Masonry.h"

@interface TransitionViewController ()

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIView *sencondView;
@property (nonatomic, assign) BOOL showFirstView;
@property (nonatomic, assign) NSUInteger TransitionType;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.showFirstView = YES;
    self.TransitionType = UIViewAnimationOptionTransitionNone;
    
    self.firstView = [UIView new];
    self.firstView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.firstView];
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 400));
    }];
    
    self.sencondView = [UIView new];
    self.sencondView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.sencondView];
    [self.sencondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 200));
    }];
    [self.view bringSubviewToFront:self.firstView];
}

- (IBAction)transition:(id)sender {
    
    if (self.showFirstView) {
        [UIView transitionFromView:self.firstView toView:self.sencondView duration:1.5 options:UIViewAnimationOptionShowHideTransitionViews|self.TransitionType completion:^(BOOL finished) {
        }];
    } else {
        [UIView transitionFromView:self.sencondView
                            toView:self.firstView
                          duration:1.5
                           options:UIViewAnimationOptionShowHideTransitionViews|self.TransitionType
                        completion:^(BOOL finished) {
        }];
    }
    
    self.showFirstView = !self.showFirstView;
    self.TransitionType += (1<<20);
    if(self.TransitionType == (7 << 20)) {
        self.TransitionType = UIViewAnimationOptionTransitionNone;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
