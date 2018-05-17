//
//  SHDigTextCell.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/16.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHDigLogObj.h"

@interface SHDigTextCell : UITableViewCell

/*创建TableviewCell**/
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) SHDigLogObj *digLogObj;
@end
