//
//  SHPopView.m
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/17.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHPopView.h"
#import "SHPopCell.h"
#import "SHDrawTriangle.h"
#import "Masonry.h"

static CGFloat const kTriangleH = 15.0f;

@interface SHPopView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray <SHPopModel *>*tableDataSource;
@property (nonatomic, strong) SHDrawTriangle *drawTriangleView;
@end


@implementation SHPopView


- (instancetype)initWithTableDataSource:(NSArray <SHPopModel *>*)tableDataSource {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.tableDataSource = tableDataSource;
        self.frame = [UIApplication sharedApplication].keyWindow.bounds;
        [self addSubview:self.maskView];
        [self.tableView registerClass:[SHPopCell class] forCellReuseIdentifier:@"SHPopCell"];
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
    SHPopCell *cell = [SHPopCell cellWithTableView:tableView];
    cell.popModel = [self modelForIndexPath:indexPath];
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
- (SHPopModel *)modelForIndexPath:(NSIndexPath *)indexPath {
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
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(120.0f);
            make.height.mas_equalTo(self.tableDataSource.count * kPopCellHeight);
        }];
    }
    return _tableView;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:self.bounds];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableHidden)];
        [_maskView addGestureRecognizer:tapGesture];
    }
    return _maskView;
}

- (NSArray<SHPopModel *> *)tableDataSource {
    if (!_tableDataSource) {
        _tableDataSource = [NSArray array];
    }
    return _tableDataSource;
}

/**
画一个三角形
 */
- (void)drawView:(CGRect)rect {
    CGPoint piont1;
    piont1.x = 7.5;
    piont1.y = 0;
    CGPoint piont2;
    piont2.x = 0;
    piont2.y = 15;
    CGPoint piont3;
    piont3.x = 15;
    piont3.y = 15;

    SHDrawTriangle *drawTriangle = [[SHDrawTriangle alloc] initStartPoint:piont1 middlePoint:piont2 endPoint:piont3 color:[[self.tableDataSource firstObject] backgroundColor]];
    drawTriangle.frame = rect;
    [self addSubview:drawTriangle];
    _drawTriangleView = drawTriangle;
}

#pragma mark  方法

- (void)tableShowCenter {
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)tableShowOnView:(UIView *)view {
    CGRect ret = view.frame;
    CGFloat rectx = ret.origin.x + ret.size.width * 0.5;
    CGFloat recty = ret.origin.y + ret.size.height;
    [self drawView:CGRectMake(rectx, recty, kTriangleH, kTriangleH)];

    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.drawTriangleView.mas_bottom);
        make.centerX.mas_equalTo(self.drawTriangleView.mas_centerX);
    }];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)tableHidden {
    [self removeFromSuperview];
}

- (void)setTriangleColor:(UIColor *)triangleColor {
    _triangleColor = triangleColor;
    
}

@end
