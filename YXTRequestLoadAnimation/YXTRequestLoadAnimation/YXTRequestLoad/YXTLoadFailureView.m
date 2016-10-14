//
//  YXTLoadFailureView.m
//  YXTRequestLoadAnimation
//
//  Created by 杨小童 on 16/5/18.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "YXTLoadFailureView.h"

@implementation YXTLoadFailureView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIView *failView = [[UIView alloc] initWithFrame:frame];
        [failView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:failView];
        
        UIImageView *failImageView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 105, 135, 130)];
        failImageView.image = [UIImage imageNamed:@"NoNetImage.png"];
        [failView addSubview:failImageView];
        
        UILabel *failLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 265, 295, 20)];
        [failLabel setText:@"出错啦 ! 该页面可能已经损坏"];
        [failLabel setTextAlignment:NSTextAlignmentCenter];
        [failLabel setTextColor:[UIColor grayColor]];
        [failView addSubview:failLabel];
        
        UILabel *failLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 300, 295, 20)];
        [failLabel2 setText:@"赶紧查看网络吧 ! "];
        [failLabel2 setTextAlignment:NSTextAlignmentCenter];
        [failLabel2 setTextColor:[UIColor grayColor]];
        [failView addSubview:failLabel2];
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(100, 350, 175, 40)];
        [button setBackgroundColor:[UIColor colorWithRed:246 / 255.0 green:134 / 255.0 blue:105 / 255.0 alpha:1]];
        [button setTitle:@"再试一次" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(againRequest) forControlEvents:UIControlEventTouchUpInside];
        [failView addSubview:button];
        
        [self addSubview:failView];
        
    }
    
    return self;
}

- (void)againRequest
{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(reloadRequest)]) {
        
//        [self.delegate performSelector:@selector(reloadRequest) withObject:sender]
        [self.delegate reloadRequest];
    }
    
}

@end
