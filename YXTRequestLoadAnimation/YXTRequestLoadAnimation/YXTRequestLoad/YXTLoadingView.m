//
//  YXTLoadingView.m
//  YXTRequestLoadAnimation
//
//  Created by 杨小童 on 16/5/18.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "YXTLoadingView.h"

@implementation YXTLoadingView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        UIView *loadView = [[UIView alloc] initWithFrame:frame];
        [loadView setBackgroundColor:[UIColor colorWithRed:248 / 255.0 green:252 / 255.0 blue:253 / 255.0 alpha:1]];
        [self addSubview:loadView];
        
        // 创建一个UIImageView
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(80 * [UIScreen mainScreen].bounds.size.width / 375, 180 * [UIScreen mainScreen].bounds.size.height / 667, 215 * [UIScreen mainScreen].bounds.size.width / 375, 200 * [UIScreen mainScreen].bounds.size.height / 667)];
        [loadView addSubview:imageView];
        
        NSMutableArray *images = [NSMutableArray array];
        for (int i = 1; i < 3; i++) {
            NSString *name = [NSString stringWithFormat:@"CCloading－%d.tiff", i];
            UIImage *image = [UIImage imageNamed:name];
            [images addObject:image];
        }
        //
        imageView.animationImages = images;
        // 需要设置播放一次的时间
        imageView.animationDuration = 0.3f;
        // 设置播放次数
        //    imageView.animationRepeatCount = 5;
        // 开始动画
        [imageView startAnimating];
        
        
    }
    
    return self;
}

@end
