//
//  SHDiaLogCell.m
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/15.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHDiaLogCell.h"
#import "Masonry.h"
@interface SHDiaLogCell ()

@property (nonatomic, weak) UILabel *diaTextLabel;

@end

@implementation SHDiaLogCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {

    NSString *ID = NSStringFromClass([SHDiaLogCell class]);

    SHDiaLogCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SHDiaLogCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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

    UILabel *diaTextLabel = [[UILabel alloc] init];
    diaTextLabel.text = @"标题信息";
    diaTextLabel.textAlignment = NSTextAlignmentCenter;
    diaTextLabel.textColor = [UIColor blackColor];
    diaTextLabel.font = [UIFont systemFontOfSize:14.0f];
    diaTextLabel.numberOfLines = 0;
    _diaTextLabel = diaTextLabel;
    [self.contentView addSubview:_diaTextLabel];

}

#pragma mark - Layout
- (void)setupLayout {
    [_diaTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20.0f);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20.0f);
        make.height.mas_equalTo(kSHDiaLogCellHeight);
        make.top.bottom.mas_equalTo(self.contentView);
    }];

}
- (void)setDigLogObj:(SHDigLogObj *)digLogObj {
    _digLogObj = digLogObj;

    _diaTextLabel.text = _digLogObj.text;
    _diaTextLabel.textAlignment = _digLogObj.textAligment;
    _diaTextLabel.textColor = _digLogObj.color;
    _diaTextLabel.font = _digLogObj.font;

}
@end
