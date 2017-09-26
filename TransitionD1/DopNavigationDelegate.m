//
//  DopNavigationDelegate.m
//  TransitionD1
//
//  Created by oxape on 16/10/14.
//  Copyright © 2016年 oxape. All rights reserved.
//

#import "DopNavigationDelegate.h"
#import "DopNavigationAnimationController.h"

@implementation DopNavigationDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [DopNavigationAnimationController new];
}

@end
