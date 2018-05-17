//
//  SHPopCell.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/17.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHPopModel.h"

static CGFloat const kPopCellHeight = 40.0f;

@interface SHPopCell : UITableViewCell

/*创建TableviewCell**/
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) SHPopModel *popModel;
@end
