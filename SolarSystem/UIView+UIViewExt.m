//
//  UIView+UIViewExt.m
//  SolarSystem
//
//  Created by 姜宁桃 on 2017/2/16.
//  Copyright © 2017年 姜宁桃. All rights reserved.
//

#import "UIView+UIViewExt.h"
// 获取中心点
CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint point;
    point.x = CGRectGetMidX(rect);
    point.y = CGRectGetMidY(rect);
    
    return point;
}

// 中心移动到某点
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center)
{
    CGRect newRect = CGRectZero;
    newRect.origin.x = center.x - CGRectGetMidX(rect);
    newRect.origin.y = center.y - CGRectGetMidY(rect);
    newRect.size = rect.size;
    
    return newRect;
}

@implementation UIView (UIViewExt)
// 原点
- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)_origin
{
    CGRect newframe = self.frame;
    newframe.origin = _origin;
    self.frame = newframe;
}

// 大小
- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)_size
{
    CGRect newframe = self.frame;
    newframe.size = _size;
    self.frame = newframe;
}

// 右下角 点坐标
- (CGPoint)bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    
    return CGPointMake(x, y);
}

// 左下角 点
- (CGPoint)bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    
    return CGPointMake(x, y);
}

// 右上角 点
- (CGPoint)topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    
    return CGPointMake(x, y);
}


#pragma mark - 上、下、左、右、 宽、高 等基本属性
// 高
- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)_height
{
    CGRect newFrame = self.frame;
    newFrame.size.height = _height;
    self.frame = newFrame;
}

//宽
- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)_width
{
    CGRect newFrame = self.frame;
    newFrame.size.width = _width;
    self.frame = newFrame;
}

//上
- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)_top
{
    CGRect newframe = self.frame;
    newframe.origin.y = _top;
    self.frame = newframe;
}

//左
- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)_left
{
    CGRect newframe = self.frame;
    newframe.origin.x = _left;
    self.frame = newframe;
}

//下
- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)_bottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = _bottom - self.frame.size.height;
    self.frame = newframe;
}

//右
- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)_right
{
    CGFloat delta = _right - (self.frame.origin.x + self.frame.size.width);
    CGRect newFrame = self.frame;
    newFrame.origin.x += delta;
    self.frame = newFrame;
}


// 中心点从某点移动
- (void)moveBy:(CGPoint)delta
{
    CGPoint newCenter = self.center;
    newCenter.x += delta.x;
    newCenter.y += delta.y;
    self.center = newCenter;
}

// 根据大小比例改变大小
- (void)scaleBy:(CGFloat)scaleFactor
{
    CGRect newFrame = self.frame;
    newFrame.size.width *= scaleFactor;
    newFrame.size.height *= scaleFactor;
    self.frame = newFrame;
}

// 适合大小
- (void)fitInsize:(CGSize)aSize
{
    CGFloat scale;
    CGRect newFrame = self.frame;
    
    if (newFrame.size.height && (newFrame.size.height > aSize.height)) {
        scale = aSize.height / newFrame.size.height;
        newFrame.size.width *= scale;
        newFrame.size.height *= scale;
    }
    
    if (newFrame.size.width && (newFrame.size.width >= aSize.width)) {
        scale = aSize.width / newFrame.size.width;
        newFrame.size.width *= scale;
        newFrame.size.height *= scale;
    }
    
    self.frame = newFrame;
}

@end
