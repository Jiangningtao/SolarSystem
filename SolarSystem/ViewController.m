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
    UIImageView * _homeImageView;
    
    UIImageView * _star1;
    UIImageView * _star2;
    UIImageView * _star3;
    UIImageView * _star4;
    UIImageView * _star5;
    UIImageView * _star6;
    UIImageView * _star7;
    
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
    
    [self configBigDipperStars];    // 北斗七星
    
    _sunImageView = [UIImageView imageViewWithFrame:CGRectMake(20, 20, 120, 120) image:@"sun"];
    [_bgView addSubview:_sunImageView];
    
    _bgOfSolarSystem = [[UIView alloc] initWithFrame:CGRectMake(screen_width/2-60, _sunImageView.top - 180, 120, 120)];
    [_bgView addSubview:_bgOfSolarSystem];
    
    _moonImageView = [UIImageView imageViewWithFrame:CGRectMake(30, 30, 60, 60) image:@"moon"];
    [_bgOfSolarSystem addSubview:_moonImageView];
    
    _earthImageView = [UIImageView imageViewWithFrame:CGRectMake(0, _moonImageView.center.y - 12.5 , 25, 25) image:@"earth"];
    [_bgOfSolarSystem addSubview:_earthImageView];
    
    
    _homeImageView = [UIImageView imageViewWithFrame:CGRectMake(55*widthScale, 319*heightScale, 142*widthScale, 248*heightScale) image:@"home"];
    [_bgView addSubview:_homeImageView];
    
    
    [self configAutoroatationAnimation];    // 自转动画
    [self configRevolutionAnimation];       // 公转动画
}

- (void)configBigDipperStars
{
    _star1 = [UIImageView imageViewWithFrame:CGRectMake(149.86, 74.67, 17, 16) image:@"star1"];
    [_bgView addSubview:_star1];
    
    _star2 = [UIImageView imageViewWithFrame:CGRectMake(160, 43, 14, 13) image:@"star2"];
    [_bgView addSubview:_star2];
    
    _star3 = [UIImageView imageViewWithFrame:CGRectMake(198, 40, 17, 16) image:@"star3"];
    [_bgView addSubview:_star3];
    
    _star4 = [UIImageView imageViewWithFrame:CGRectMake(205, 68, 12, 11) image:@"star4"];
    [_bgView addSubview:_star4];
    
    _star5 = [UIImageView imageViewWithFrame:CGRectMake(234, 80, 19, 18) image:@"star5"];
    [_bgView addSubview:_star5];
    
    _star6 = [UIImageView imageViewWithFrame:CGRectMake(263, 98, 13, 12) image:@"star6"];
    [_bgView addSubview:_star6];
    
    _star7 = [UIImageView imageViewWithFrame:CGRectMake(290, 90, 16, 15) image:@"star7"];
    [_bgView addSubview:_star7];
    
    [self configBigDipperStarSpangleAnimation];  // 星星闪烁动画
}

- (void)configBigDipperStarSpangleAnimation
{
    [self star4_star6Animation];
    [self star1_star2Animation];
    [self star3_star5_star7Animation];
    
}

- (void)star1_star2Animation
{
    [UIView animateWithDuration:0.8 delay:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
        
        _star1.transform = CGAffineTransformMakeScale(0.8, 0.8);
        _star2.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            _star1.transform = CGAffineTransformMakeScale(1.2, 1.2);
            _star2.transform = CGAffineTransformMakeScale(0.6, 0.6);
        } completion:^(BOOL finished) {
            
            [self star1_star2Animation];
        }];
    }];
}

- (void)star3_star5_star7Animation
{
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        _star3.transform = CGAffineTransformMakeScale(0.6, 0.6);
        _star5.transform = CGAffineTransformMakeScale(1.0, 1.0);
        _star7.transform = CGAffineTransformMakeScale(1.3, 1.3);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            _star3.transform = CGAffineTransformMakeScale(1.2, 1.2);
            _star5.transform = CGAffineTransformMakeScale(0.4, 0.4);
            _star7.transform = CGAffineTransformMakeScale(0.6, 0.6);
        } completion:^(BOOL finished) {
            
            [self star3_star5_star7Animation];
        }];
    }];
}

- (void)star4_star6Animation
{
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        _star4.transform = CGAffineTransformMakeScale(1.2, 1.2);
        _star6.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            _star4.transform = CGAffineTransformMakeScale(0.5, 0.5);
            _star6.transform = CGAffineTransformMakeScale(0.6, 0.6);
        } completion:^(BOOL finished) {
            
            [self star4_star6Animation];
        }];
    }];
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
    CGPathAddArc(path1, NULL, _sunImageView.center.x, _sunImageView.center.y, 160, 0,M_PI * 2, 0);
    CAKeyframeAnimation * animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation1.path = path1;
    CGPathRelease(path1);
    animation1.duration = 60;
    animation1.repeatCount = 500;
    animation1.autoreverses = NO;
    animation1.rotationMode =kCAAnimationRotateAuto;
    animation1.fillMode =kCAFillModeForwards;
    [_bgOfSolarSystem.layer addAnimation:animation1 forKey:nil];
    
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGPathAddArc(path2, NULL, _moonImageView.center.x, _moonImageView.center.y, 60, 0,M_PI * 2, 0);
    CAKeyframeAnimation * animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation2.path = path2;
    CGPathRelease(path2);
    animation2.duration = 24;
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
