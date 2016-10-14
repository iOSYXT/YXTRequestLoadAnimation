//
//  YXTLoadFailureView.h
//  YXTRequestLoadAnimation
//
//  Created by 杨小童 on 16/5/18.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXTLoadFailureViewDelegate <NSObject>

- (void)reloadRequest;

@end

@interface YXTLoadFailureView : UIView

-(instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, assign) id<YXTLoadFailureViewDelegate>delegate;

@end
