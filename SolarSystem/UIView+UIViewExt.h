//
//  UIView+UIViewExt.h
//  SolarSystem
//
//  Created by 姜宁桃 on 2017/2/16.
//  Copyright © 2017年 姜宁桃. All rights reserved.
//

#import <UIKit/UIKit.h>

// 获取中心点
CGPoint CGRectGetCenter(CGRect rect);
// 中心移动到某点
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (UIViewExt)

@property CGPoint origin;   //原点
@property CGSize size;      //大小

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

#pragma mark - 上、下、左、右、 宽、高 等基本属性
@property CGFloat height;
@property CGFloat width;
@property CGFloat top;
@property CGFloat left;
@property CGFloat bottom;
@property CGFloat right;

- (void)moveBy:(CGPoint)delta;          // 中心点从某点移动
- (void)scaleBy:(CGFloat)scaleFactor;   // 根据大小比例改变大小
- (void)fitInsize:(CGSize)aSize;        // 适合大小

@end
