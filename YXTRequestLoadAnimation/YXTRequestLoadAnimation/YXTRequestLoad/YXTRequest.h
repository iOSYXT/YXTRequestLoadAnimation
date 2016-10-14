//
//  YXTRequest.h
//  YXTRequestLoadAnimation
//
//  Created by 杨小童 on 16/5/18.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

//  请求成功回调
typedef void (^requestSuccess)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject);
//  请求失败回调
typedef void (^requestFailure)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error);

@interface YXTRequest : NSObject

/**
*  POST请求--加载动画版（加载动画版网络请求用此方法）
*
*  @param vc         当前界面的VC
*  @param URLString  请求的地址
*  @param parameters 请求的参数
*  @param success    请求成功的回调
*  @param failure    请求失败的回调
*/
+ (void)requestPOSTWithVC:(nonnull UIViewController*)vc URLString:(nonnull NSString*)URLString parameters:(nullable id)parameters success:(nullable requestSuccess)success failure:(nullable requestFailure)failure;

/**
 *  POST请求--菊花提示版（菊花版网络请求用此方法）
 *
 *  @param vc         当前界面的VC
 *  @param URLString  请求的地址
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)requestAlertPOSTWithVC:(nonnull UIViewController*)vc URLString:(nonnull NSString*)URLString parameters:(nullable id)parameters success:(nullable requestSuccess)success failure:(nullable requestFailure)failure;

@end
