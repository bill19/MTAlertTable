//
//  MTAlertTable.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/15.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTAlertObj;

typedef void (^AlertTableDidSelect) (MTAlertObj *obj ,NSInteger index);

@interface MTAlertTable : UIView

@property(nonatomic, copy) AlertTableDidSelect tableDidselect;

/**
 创建方法

 @param tableDataSource 数据原信息
 @return self
 */
- (instancetype)initWithTableDataSource:(NSArray <MTAlertObj *>*)tableDataSource NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

/**
 展示alertview
 */
- (void)tableShow;
/**
 隐藏alertview
 */
- (void)tableHidden;

@end
