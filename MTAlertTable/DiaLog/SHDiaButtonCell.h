//
//  SHDiaButtonCell.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/17.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^firstButtonClick)(UIButton *sender);
typedef void(^secondButtonClick)(UIButton *sender);

@interface SHDiaButtonCell : UITableViewCell

/*创建TableviewCell**/
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, copy) firstButtonClick  firstBtnClick;
@property (nonatomic, copy) secondButtonClick secondBtnClick;

@end
