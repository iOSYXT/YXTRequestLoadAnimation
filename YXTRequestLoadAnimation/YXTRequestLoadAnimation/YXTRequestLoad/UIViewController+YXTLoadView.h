//
//  UIViewController+YXTLoadView.h
//  YXTRequestLoadAnimation
//
//  Created by 杨小童 on 16/5/18.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YXTLoadFailureView.h"

@interface UIViewController (YXTLoadView)<YXTLoadFailureViewDelegate>

// 为控制器扩展方法：这个方法必须声明，并且和每个ViewController的网络请求调用的方法名一致（任何时候调用网络请求，都需要把请求封装在“request”方法里进行调用）
- (void)request;

// 显示加载动画View
- (void)showRequestLoadView;
// 隐藏加载动画View
- (void)hideRequestLoadView;
// 显示请求失败View
- (void)showRequestFailureView;
// 隐藏请求失败View
- (void)hideRequestFailureView;
// 显示加载菊花提醒View
- (void)showAlertView;
// 隐藏加载菊花提醒View
- (void)hideAlertView;

@end
