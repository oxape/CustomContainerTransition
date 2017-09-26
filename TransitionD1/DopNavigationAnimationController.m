//
//  DopNavigationAnimationController.m
//  TransitionD1
//
//  Created by oxape on 16/10/14.
//  Copyright © 2016年 oxape. All rights reserved.
//

#import "DopNavigationAnimationController.h"

@implementation DopNavigationAnimationController

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.5;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *contrainView = [transitionContext containerView];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    [contrainView addSubview:toView];
    
    CGFloat translation = contrainView.frame.size.height;
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, translation);
    transform = CGAffineTransformScale(transform, 0.1, 0.1);
    toView.transform = transform;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = CGAffineTransformMakeTranslation(0, -translation);
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        
        //一定要调用completeTransition否则系统会认为转场被中断，还显示fromView。
        BOOL isCancelled = [transitionContext transitionWasCancelled];
        //- (void)completeTransition:(BOOL)didComplete;
        //如果传入YES,fromView会被移除containerView，传入NO，相当于转场被取消没有完成，from不会被移除，toView也没有add进去(另一种说法addSubview之后被移除了)，也就是还是显示fromView
        [transitionContext completeTransition:!isCancelled];
    }];
}

@end
