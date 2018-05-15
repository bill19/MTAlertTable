//
//  MTAlertCell.m
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/15.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "MTAlertCell.h"
#import "Masonry.h"

static CGFloat const kMTAlertContentCellHeight = 48.0f;

@interface MTAlertCell ()

@property (nonatomic, weak) UILabel *phoneName;
@property (nonatomic, weak) UILabel *phoneNumber;
@property (nonatomic, weak) UIView *bottomLine;

@end

@implementation MTAlertCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {

    NSString *ID = NSStringFromClass([MTAlertCell class]);

    MTAlertCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MTAlertCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryNone];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setupSubViews];
        [self setupLayout];
    }
    return self;
}

#pragma mark - UISetup
- (void)setupSubViews {
    UILabel *phoneName = [[UILabel alloc] init];
    phoneName.textColor = [UIColor blackColor];
    phoneName.textAlignment = NSTextAlignmentRight;
    _phoneName = phoneName;
    [self.contentView addSubview:_phoneName];

    UILabel *phoneNumber = [[UILabel alloc] init];
    phoneNumber.textColor = [UIColor blackColor];
    phoneNumber.textAlignment = NSTextAlignmentLeft;
    _phoneNumber = phoneNumber;
    [self.contentView addSubview:_phoneNumber];

    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor grayColor];
    bottomLine.alpha = 0.3f;
    _bottomLine = bottomLine;
    [self.contentView addSubview:_bottomLine];

}

#pragma mark - Layout
- (void)setupLayout {

    CGFloat padding = 10.0f;
    CGFloat halfWidth = self.contentView.bounds.size.width * 0.4;
    [_phoneName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView);
        make.height.mas_equalTo(kMTAlertContentCellHeight);
        make.width.mas_equalTo(halfWidth);
    }];

    [_phoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneName);
        make.left.mas_equalTo(self.phoneName.mas_right).mas_offset(padding);
        make.height.mas_equalTo(kMTAlertContentCellHeight);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-padding);
    }];

    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneName.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1.0f);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-1.0);
    }];

}

- (void)setAlertobj:(MTAlertObj *)alertobj {
    _alertobj = alertobj;
    _phoneName.text = _alertobj.phoneName;
    _phoneNumber.text = _alertobj.phoneNumber;
}

@end
