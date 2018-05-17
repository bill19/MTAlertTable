//
//  SHPopCell.m
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/17.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHPopCell.h"
#import "Masonry.h"
@interface SHPopCell ()

@property (nonatomic, weak) UIImageView *leftImageView;

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UIView *bottomLine;
@end

@implementation SHPopCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {

    NSString *ID = NSStringFromClass([SHPopCell class]);

    SHPopCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (!cell) {
        
        cell = [[SHPopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryNone];
        [self setSelectionStyle:UITableViewCellSelectionStyleGray];
        [self setupSubViews];
        [self setupLayout];
    }
    return self;
}

#pragma mark - UISetup
- (void)setupSubViews {

    UIImageView *leftImageView = [[UIImageView alloc] init];
    _leftImageView = leftImageView;
    [self.contentView addSubview:_leftImageView];

    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:13.0f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel = titleLabel;
    [self.contentView addSubview:_titleLabel];

    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor grayColor];
    bottomLine.alpha = 0.3f;
    _bottomLine = bottomLine;
    [self.contentView addSubview:_bottomLine];
}

#pragma mark - Layout
- (void)setupLayout {
    CGFloat padding = 10.0f;
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView).mas_offset(padding);
        make.height.width.mas_equalTo(kPopCellHeight - 2 * padding);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-padding);
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(padding);
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(padding);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-padding);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-padding);
    }];

    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1.0f);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-1.0);
    }];
}

- (void)setPopModel:(SHPopModel *)popModel {
    _popModel = popModel;
    _leftImageView.image = [UIImage imageNamed:_popModel.imageName];
    _titleLabel.text = _popModel.title;
    _titleLabel.textColor = _popModel.titleColor;
    self.contentView.backgroundColor = _popModel.backgroundColor;
}

@end
