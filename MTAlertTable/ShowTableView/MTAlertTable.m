//
//  MTAlertTable.m
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/15.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "MTAlertTable.h"
#import "MTAlertCell.h"
#import "MTAlertObj.h"
#import "Masonry.h"
@interface MTAlertTable () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray <MTAlertObj *>*tableDataSource;
@end

@implementation MTAlertTable

- (instancetype)initWithTableDataSource:(NSArray <MTAlertObj *>*)tableDataSource {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.tableDataSource = tableDataSource;
        self.frame = [UIApplication sharedApplication].keyWindow.bounds;
        [self addSubview:self.maskView];
        [self.tableView registerClass:[MTAlertCell class] forCellReuseIdentifier:@"MTAlertCell"];
    }
    return self;
}

#pragma mark - data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTAlertCell *cell = [MTAlertCell cellWithTableView:tableView];
    cell.alertobj = [self modelForIndexPath:indexPath];
    return cell;

}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableDidselect) {
        self.tableDidselect([self modelForIndexPath:indexPath], indexPath.row);
    }

    [self tableHidden];
}

#pragma mark - model handler
- (MTAlertObj *)modelForIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.tableDataSource.count) {
        return self.tableDataSource[indexPath.row];
    }
    return nil;
}

#pragma mark - others

#pragma mark - setters

#pragma mark getters
- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 100.0f;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = [UITableViewHeaderFooterView new];
        tableView.layer.cornerRadius = 5.0;
        tableView.layer.masksToBounds = YES;
        tableView.bounces = NO;
        [self addSubview:tableView];
        _tableView = tableView;
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(30.0f);
            make.right.mas_equalTo(self.mas_right).offset(-30.0f);
            make.height.mas_equalTo(self.tableDataSource.count * kMTAlertCellHeight);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return _tableView;
}

- (UIView *)maskView {
    if (!_maskView) {
        CGFloat color = 10.0/255.0;
        _maskView = [[UIView alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithRed:color green:color blue:color alpha:.8];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableHidden)];
        [_maskView addGestureRecognizer:tapGesture];
    }
    return _maskView;
}

- (NSArray<MTAlertObj *> *)tableDataSource {
    if (!_tableDataSource) {
        _tableDataSource = [NSArray array];
    }
    return _tableDataSource;
}

#pragma mark  方法

- (void)tableShow {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}


- (void)tableHidden {
    [self removeFromSuperview];
}

@end

