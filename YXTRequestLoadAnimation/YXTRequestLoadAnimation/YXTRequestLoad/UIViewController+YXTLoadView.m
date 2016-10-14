//
//  UIViewController+YXTLoadView.m
//  YXTRequestLoadAnimation
//
//  Created by 杨小童 on 16/5/18.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "UIViewController+YXTLoadView.h"

// 正在加载的界面
#import "YXTLoadingView.h"
// 加载失败的界面
#import "YXTLoadFailureView.h"
// 加载菊花提醒的界面
#import "YXTAlertChrysanthemumView.h"

@implementation UIViewController (YXTLoadView)

static YXTLoadingView *loadingView;
static YXTLoadFailureView *loadFailureView;
static YXTAlertChrysanthemumView *alertChrysanthemumView;

- (void)showRequestLoadView
{
    // 防止重复创建YXTLoadingView，也可以用hidden
    [self hideRequestLoadView];
    
    loadingView = [[YXTLoadingView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    [self.view addSubview:loadingView];
}

- (void)hideRequestLoadView
{
    [loadingView removeFromSuperview];
}

- (void)showRequestFailureView
{
    // 防止重复创建YXTLoadingView
    [self hideRequestFailureView];
    
    loadFailureView = [[YXTLoadFailureView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    loadFailureView.delegate = self;
    [self.view addSubview:loadFailureView];
}

- (void)hideRequestFailureView
{
    [loadFailureView removeFromSuperview];
}

- (void)reloadRequest
{
    
    if ([self respondsToSelector:@selector(request)]) {
//        [self performSelector:@selector(request)];
        [self request];
    }
}

- (void)request
{
    NSLog(@"如果不写“request”这个方法，在上面的“reloadRequest”方法里调用“[self request]”会报错");
}

// 显示加载菊花提醒View
- (void)showAlertView
{
    // 防止重复创建YXTAlertChrysanthemumView
    [self hideAlertView];
    
    alertChrysanthemumView = [[YXTAlertChrysanthemumView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    [self.view addSubview:alertChrysanthemumView];
}

// 隐藏加载菊花提醒View
- (void)hideAlertView
{
    [alertChrysanthemumView removeFromSuperview];
}

@end
