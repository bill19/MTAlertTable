//
//  SHDiaLogCell.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/15.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHDigLogObj.h"

static CGFloat const kSHDiaLogCellHeight = 38.0f;

@interface SHDiaLogCell : UITableViewCell

/*创建TableviewCell**/
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) SHDigLogObj *digLogObj;
@end
