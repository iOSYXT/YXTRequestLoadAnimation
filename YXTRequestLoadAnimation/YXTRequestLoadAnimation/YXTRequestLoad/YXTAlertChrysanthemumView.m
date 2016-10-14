//
//  YXTAlertChrysanthemumView.m
//  YXTRequestLoadAnimation
//
//  Created by 杨小童 on 16/5/19.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "YXTAlertChrysanthemumView.h"

@implementation YXTAlertChrysanthemumView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        UIView *loadView = [[UIView alloc] initWithFrame:frame];
        [loadView setBackgroundColor:[UIColor colorWithRed:248 / 255.0 green:252 / 255.0 blue:253 / 255.0 alpha:1]];
        [self addSubview:loadView];
        
        // 创建一个UIImageView
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(375 / 2 - 25, 600 / 2 - 100, 50, 50)];
        [loadView addSubview:imageView];
        
        NSMutableArray *images = [NSMutableArray array];
        for (int i = 1; i < 10; i++) {
            NSString *name = [NSString stringWithFormat:@"loading0%d.png", i];
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
