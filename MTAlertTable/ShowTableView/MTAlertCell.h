//
//  MTAlertCell.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/15.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTAlertObj.h"
static CGFloat const kMTAlertCellHeight = 50.0f;

@interface MTAlertCell : UITableViewCell

/*创建TableviewCell**/
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) MTAlertObj *alertobj;

@end
