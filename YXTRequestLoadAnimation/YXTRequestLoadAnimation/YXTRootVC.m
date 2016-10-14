//
//  YXTRootVC.m
//  YXTRequestLoadAnimation
//
//  Created by 杨小童 on 16/5/18.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "YXTRootVC.h"

#import "YXTRequest.h"

@interface YXTRootVC ()

@end

@implementation YXTRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
#pragma mark - 加载动画版（调用的方法名必须与类目“UIViewController+YXTLoadView”里的方法名一致）
    [self request];
    
#pragma mark - 加载菊花版（可以自定义调用的方法名）
//    [self req];
}

- (void)request
{
    [YXTRequest requestPOSTWithVC:self URLString:@"http://api-1.xianhenet.com/hunparapp2/sysNew/getSysNewList" parameters:@{@"deviceType":@(0)} success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject--%@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        
        NSLog(@"error--%@", error);
        
    }];
}

- (void)req
{
    [YXTRequest requestAlertPOSTWithVC:self URLString:@"http://api-1.xianhenet.com/hunparapp2/sysNew/getSysNewList" parameters:@{@"deviceType":@(0)} success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject--%@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        
        NSLog(@"error--%@", error);
        
    }];
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
