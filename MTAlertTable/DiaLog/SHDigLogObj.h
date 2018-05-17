//
//  SHDigLogObj.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/15.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SHDigLogObj : NSObject

/**
 设置唯一标识
 */
@property (nonatomic, copy) NSString *ID;
/**
 文字信息
 */
@property (nonatomic, copy) NSString *text;

/**
 字体样式
 */
@property (nonatomic, strong) UIFont *font;

/**
 居中样式
 */
@property (nonatomic, assign) NSTextAlignment textAligment;

/**
 字体颜色
 */
@property (nonatomic, strong) UIColor *color;

@end
