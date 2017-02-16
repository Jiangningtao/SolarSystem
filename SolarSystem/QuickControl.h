//
//  QuickControl.h
//  SolarSystem
//
//  Created by 姜宁桃 on 2017/2/16.
//  Copyright © 2017年 姜宁桃. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//目的为了快速创建控件
//  label,button,imageView
@interface UILabel (QuickControl)
// 快速创建label的方法
+ (id)labelWithFrame:(CGRect)frame text:(NSString *)text font:(float)font textColor:(UIColor *)color;

@end

@interface UIButton (QuickControl)
// 快速创建button的方法
+ (id)buttonWithFrame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)color image:(NSString *)image target:(id)target action:(SEL)action;

@end

@interface UIImageView (QuickControl)
//快速创建imageView的方法
+ (id)imageViewWithFrame:(CGRect)frame image:(NSString *)image;

@end

@interface UIView (QuickControl)
//设置圆角属性
- (void)setCornerRadius:(float)radius;

@end


@interface QuickControl : NSObject

//判断系统版本
+ (int)OSVersion;

@end
