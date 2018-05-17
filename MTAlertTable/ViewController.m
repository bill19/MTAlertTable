//
//  ViewController.m
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/15.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "MTAlertTable.h"
#import "MTAlertObj.h"
#import "SHPopView.h"
#import "SHPopModel.h"
#import "SHDrawTriangle.h"
#import "SHDiaLog.h"
#import "SHDigLogObj.h"
@interface ViewController ()
@property (nonatomic, weak) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    _button = button;
}
- (void)btnClick {
    [self diaLog];
}

- (void)diaLog {
    NSMutableArray *mu = [NSMutableArray array];
    for (NSInteger index = 0; index < 4; index++) {
        SHDigLogObj *obj = [SHDigLogObj new];
        obj.ID = [NSString stringWithFormat:@"%ld",index];
        switch (index) {
            case 0:
            {
                obj.text = @"标题";
            }
                break;
            case 1:
            {
                obj.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
            }
                break;
            default:
                break;
        }
        [mu addObject:obj];
    }
    SHDiaLog *alertTable = [[SHDiaLog alloc] initWithTableDataSource:mu];
    [alertTable tableShow];

}

- (void)popModels {
    NSMutableArray *mu = [NSMutableArray array];
    for (NSInteger index = 0; index < 4; index++) {
        SHPopModel *obj = [SHPopModel new];
        obj.index = index;
        obj.title = @"名字";
        obj.imageName = @"Liaison_Msg";
        obj.backgroundColor = [UIColor greenColor];
        [mu addObject:obj];
    }
    SHPopView *alertTable = [[SHPopView alloc] initWithTableDataSource:mu];
    alertTable.tableDidselect = ^(SHPopModel *obj, NSInteger index) {
        NSLog(@"--点击了  %ld number = %@",obj.index,obj.title);
    };
    [alertTable tableShowOnView:_button];
}


- (void)alertModels {
    NSMutableArray *mu = [NSMutableArray array];
    for (NSInteger index = 0; index < 3; index++) {
        MTAlertObj *obj = [MTAlertObj new];
        obj.phoneName = @"名字:";
        obj.ID = @(index);
        obj.phoneNumber = [NSString stringWithFormat:@"133 7777 998%ld",index];
        [mu addObject:obj];
    }
    MTAlertTable *alertTable = [[MTAlertTable alloc] initWithTableDataSource:mu];
    alertTable.tableDidselect = ^(MTAlertObj *obj, NSInteger index) {
        NSLog(@"--点击了  %@ number = %@",obj.ID,obj.phoneNumber);
    };
    [alertTable tableShow];

}


@end
