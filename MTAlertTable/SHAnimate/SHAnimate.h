//
//  SHAnimate.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/21.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define kAnimateScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kAnimateScreenHeight [UIScreen mainScreen].bounds.size.height
@interface SHAnimate : NSObject

/**
 向上移动 底部弹出

 @param view 需要移动的view
 */
+ (void)up_animateForView:(UIView *)view;
/**
 向下移动

 @param view 需要移动的view
 */
+ (void)down_animateForView:(UIView *)view;
/**
 向左移动

 @param view 需要移动的view
 */
+ (void)left_animateForView:(UIView *)view;
/**
 向右移动

 @param view 需要移动的view
 */
+ (void)right_animateForView:(UIView *)view;

@end
