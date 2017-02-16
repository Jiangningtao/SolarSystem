//
//  QuickControl.m
//  SolarSystem
//
//  Created by 姜宁桃 on 2017/2/16.
//  Copyright © 2017年 姜宁桃. All rights reserved.
//

#import "QuickControl.h"

@implementation UILabel (QuickControl)
// 添加快速创建label的方法
+ (id)labelWithFrame:(CGRect)frame text:(NSString *)text font:(float)font textColor:(UIColor *)color
{
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = systemFont(font);
    label.textColor = color;
    
    return label;
}

@end

@implementation UIButton (QuickControl)
// 快速创建button的方法
+ (id)buttonWithFrame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)color image:(NSString *)image target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end

@implementation UIImageView (QuickControl)
//快速创建imageView的方法
+(id)imageViewWithFrame:(CGRect)frame image:(NSString *)image
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
    
    return imageView;
}

@end

@implementation UIView (QuickControl)
//设置圆角属性
-(void)setCornerRadius:(float)radius
{
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
}

@end



@implementation QuickControl

//判断系统版本
+ (int)OSVersion
{
    // 使用UIDevice设备类别获取版本，名字。。。
    return [[[UIDevice currentDevice] systemVersion] intValue];
}

@end
