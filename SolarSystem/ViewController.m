//
//  ViewController.m
//  SolarSystem
//
//  Created by 姜宁桃 on 2017/2/16.
//  Copyright © 2017年 姜宁桃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView * _bgView;
    UIView * _bgOfSolarSystem;
    UIImageView * _bgImageView;
    UIImageView * _sunImageView;
    UIImageView * _moonImageView;
    UIImageView * _earthImageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
}

- (void)configUI
{
    _bgView = [[UIView alloc] initWithFrame:screen_bounds];
    [self.view addSubview:_bgView];
    
    _bgImageView = [UIImageView imageViewWithFrame:screen_bounds image:@"background"];
    [_bgView addSubview:_bgImageView];
    
    _sunImageView = [UIImageView imageViewWithFrame:CGRectMake(_bgView.center.x-60, _bgView.center.y-60, 120, 120) image:@"sun"];
    [_bgView addSubview:_sunImageView];
    
    _bgOfSolarSystem = [[UIView alloc] initWithFrame:CGRectMake(_sunImageView.center.x, _sunImageView.top - 180, 120, 120)];
    _bgOfSolarSystem.backgroundColor = [UIColor whiteColor];
    [_bgImageView addSubview:_bgOfSolarSystem];
    
    _moonImageView = [UIImageView imageViewWithFrame:CGRectMake(10, 10, 60, 60) image:@"moon"];
//    _moonImageView.center = _bgOfSolarSystem.center;
    [_bgOfSolarSystem addSubview:_moonImageView];
    
    _earthImageView = [UIImageView imageViewWithFrame:CGRectMake(_moonImageView.left - 10, _moonImageView.top - 10 , 25, 25) image:@"earth"];
    [_bgOfSolarSystem addSubview:_earthImageView];
    
//    [self configAutoroatationAnimation];    // 自转动画
//    [self configRevolutionAnimation];       // 公转动画
}

- (void)configAutoroatationAnimation
{
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 365;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = 10;
    [_sunImageView.layer addAnimation:animation forKey:nil];
    
    CABasicAnimation *animation1 =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation1.fromValue = [NSNumber numberWithFloat:0.f];
    animation1.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation1.duration  = 60;
    animation1.autoreverses = NO;
    animation1.fillMode =kCAFillModeForwards;
    animation1.repeatCount = 10;
    [_moonImageView.layer addAnimation:animation1 forKey:nil];
    
    CABasicAnimation *animation2 =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation2.fromValue = [NSNumber numberWithFloat:0.f];
    animation2.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation2.duration  = 24;
    animation2.autoreverses = NO;
    animation2.fillMode =kCAFillModeForwards;
    animation2.repeatCount = 10;
    [_earthImageView.layer addAnimation:animation2 forKey:nil];
}

- (void)configRevolutionAnimation
{
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathAddArc(path1, NULL, _sunImageView.center.x, _sunImageView.center.y, 140, 0,M_PI * 2, 0);
    CAKeyframeAnimation * animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation1.path = path1;
    CGPathRelease(path1);
    animation1.duration = 365;
    animation1.repeatCount = 500;
    animation1.autoreverses = NO;
    animation1.rotationMode =kCAAnimationRotateAuto;
    animation1.fillMode =kCAFillModeForwards;
    [_moonImageView.layer addAnimation:animation1 forKey:nil];
    [_earthImageView.layer addAnimation:animation1 forKey:nil];
    
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGPathAddArc(path2, NULL, _sunImageView.center.x, _sunImageView.center.y, 90, 0,M_PI * 2, 0);
    CAKeyframeAnimation * animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation2.path = path2;
    CGPathRelease(path2);
    animation2.duration = 365;
    animation2.repeatCount = 500;
    animation2.autoreverses = NO;
    animation2.rotationMode =kCAAnimationRotateAuto;
    animation2.fillMode =kCAFillModeForwards;
    [_earthImageView.layer addAnimation:animation2 forKey:@"animation2"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
