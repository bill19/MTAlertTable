//
//  SHDiaButtonCell.m
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/17.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHDiaButtonCell.h"
#import "Masonry.h"
@interface SHDiaButtonCell ()
@property (nonatomic, weak) UIButton *firstButton;
@property (nonatomic, weak) UIButton *secondButton;
@end

@implementation SHDiaButtonCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {

    NSString *ID = NSStringFromClass([SHDiaButtonCell class]);

    SHDiaButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SHDiaButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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

    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [firstButton setTitle:@"取消" forState:UIControlStateNormal];
    [firstButton addTarget:self action:@selector(firstButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [firstButton setBackgroundColor:[UIColor greenColor]];
    _firstButton = firstButton;
    [self.contentView addSubview:_firstButton];

    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [secondButton setTitle:@"确定" forState:UIControlStateNormal];
    [secondButton addTarget:self action:@selector(firstButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [secondButton setBackgroundColor:[UIColor redColor]];
    _secondButton = secondButton;
    [self.contentView addSubview:_secondButton];

}

- (void)firstButtonClick:(UIButton *)firstButton {

    if (self.firstBtnClick) {
        self.firstBtnClick(firstButton);
    }
}

- (void)secondButtonClick:(UIButton *)secondButton {
    if (self.secondBtnClick) {
        self.secondBtnClick(secondButton);
    }
}

#pragma mark - Layout
- (void)setupLayout {
    [_firstButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self.contentView);
        make.width.mas_equalTo(self.contentView.mas_width).multipliedBy(0.5);
        make.height.mas_equalTo(38.0f);
    }];

    [_secondButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.firstButton.mas_right);
        make.width.mas_equalTo(self.firstButton);
        make.top.bottom.mas_equalTo(self.contentView);
        make.height.mas_equalTo(38.0f);
    }];
}

@end
