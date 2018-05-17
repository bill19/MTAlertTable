//
//  SHPopModel.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/17.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SHPopModel : NSObject
@property (nonatomic, assign) NSInteger index;
/**
 文字内容
 */
@property (nonatomic, copy) NSString *title;

/**
 图片名称
 */
@property (nonatomic, copy) NSString *imageName;

/**
 标题颜色
 */
@property (nonatomic, strong) UIColor *titleColor;
/**
 backgroundColor颜色
 */
@property (nonatomic, strong) UIColor *backgroundColor;

@end
