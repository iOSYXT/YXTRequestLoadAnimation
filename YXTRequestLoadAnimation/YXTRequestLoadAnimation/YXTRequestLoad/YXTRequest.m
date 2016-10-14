//
//  YXTRequest.m
//  YXTRequestLoadAnimation
//
//  Created by 杨小童 on 16/5/18.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "YXTRequest.h"

// AFN网络请求
#import "AFNetworking.h"
// AFN网络检测类
#import "AFNetworkReachabilityManager.h"
// 自定义类目，为系统UIViewController类拓展类方法
#import "UIViewController+YXTLoadView.h"

@implementation YXTRequest

#pragma mark - 加载动画版网络请求用此方法
/*============================================================*/
+ (void)requestPOSTWithVC:(UIViewController *)vc URLString:(NSString *)URLString parameters:(id)parameters success:(requestSuccess)success failure:(requestFailure)failure
{
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // __weak修饰，防止在block里使用manager指针循环引用（__block修饰，可以在block内部改变变量）
    __weak AFNetworkReachabilityManager *managerSelf = manager;
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        
        NSLog(@"%ld", status);
        
        if (status > 0) {
            
            // 有网络--隐藏请求失败界面
            [vc hideRequestFailureView];
            
            // 有网状态下才进行网络请求
            [self baseRequestPOSTWithVC:vc URLString:URLString parameters:parameters success:success failure:failure];
            
        } else {
            
            // 无网络--显示请求失败界面
            [vc showRequestFailureView];
            
        }
        
        // 停止监控（防止当前界面已加载完成，用户看了一会内容却突然断网，使得已加载的内容消失。)(如果不考虑用户体验，想要实时监测网络状况，没网络就实时显示无网的界面，有网络以后就自动加载请求，那么这行代码去掉就可以）
        [managerSelf stopMonitoring];
        
        
        
    }] ;
    
    // 开始监控
    [manager startMonitoring];
}

/**
 *  基本的POST网络请求方法
 *
 *  @param vc         当前界面的VC
 *  @param URLString  请求的地址
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)baseRequestPOSTWithVC:(UIViewController *)vc URLString:(NSString *)URLString parameters:(id)parameters success:(requestSuccess)success failure:(requestFailure)failure
{
    
    AFHTTPSessionManager *manager = [self getRequestManager];
    
    // 正在加载
    [vc showRequestLoadView];
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 成功回调
        success(task,responseObject);
        // 加载完毕
        [vc hideRequestLoadView];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 失败回调
        failure(task,error);
        
        // 显示前端或后台数据错误或网络由慢到断网引发的请求失败界面
        [vc showRequestFailureView];
        
        // 加载完毕
        [vc hideRequestLoadView];
        
    }];
    
    
}
/*============================================================*/


#pragma mark - 菊花版网络请求用此方法
+ (void)requestAlertPOSTWithVC:(nonnull UIViewController*)vc URLString:(nonnull NSString*)URLString parameters:(nullable id)parameters success:(nullable requestSuccess)success failure:(nullable requestFailure)failure
{
    AFHTTPSessionManager *manager = [self getRequestManager];
    
    // 正在加载
    [vc showAlertView];
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 成功回调
        success(task,responseObject);
        // 加载完毕
        [vc hideAlertView];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 失败回调
        failure(task,error);
        
//        // 显示前端或后台数据错误或网络由慢到断网引发的请求失败界面
//        [vc showRequestFailureView];
        
        // 加载完毕
        [vc hideAlertView];
        
    }];
}

+ (AFHTTPSessionManager *)getRequestManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //设置请求超时
    manager.requestSerializer.timeoutInterval = 20;
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"html/text",@"text/json",nil];
    
    return manager;
}

/*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
 typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
 AFNetworkReachabilityStatusUnknown          = -1,      未知
 AFNetworkReachabilityStatusNotReachable     = 0,       无网络
 AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
 AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
 };
 */

/*
 //在里面可以随便写事件
 switch (status) {
 case AFNetworkReachabilityStatusUnknown:
 
 NSLog(@"未知网络状态");
 break;
 
 case AFNetworkReachabilityStatusNotReachable:
 
 NSLog(@"无网络");
 break;
 
 case AFNetworkReachabilityStatusReachableViaWWAN:
 
 NSLog(@"蜂窝数据网");
 break;
 
 case AFNetworkReachabilityStatusReachableViaWiFi:
 
 NSLog(@"WiFi网络");
 break;
 
 default:
 break;
 }
 */

@end
