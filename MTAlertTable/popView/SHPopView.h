//
//  SHPopView.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/17.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHPopModel.h"
typedef void (^PopDidSelect) (SHPopModel *obj ,NSInteger index);

@interface SHPopView : UIView

@property(nonatomic, copy) PopDidSelect tableDidselect;

/**
 创建方法

 @param tableDataSource 数据原信息
 @return self
 */
- (instancetype)initWithTableDataSource:(NSArray <SHPopModel *>*)tableDataSource NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@property (nonatomic, strong) UIColor *triangleColor;

/**
 展示alertview 在屏幕中间
 */
- (void)tableShowCenter;

/**
 展示alertview 在这个点击位置的下部分
 */
- (void)tableShowOnView:(UIView *)view;
/**
 隐藏alertview
 */
- (void)tableHidden;
@end
