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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)btnClick {
    NSMutableArray *mu = [NSMutableArray array];
    for (NSInteger index = 0; index < 3; index++) {
        MTAlertObj *obj = [MTAlertObj new];
        obj.phoneName = @"名字:";
        obj.ID = @(index);
        obj.phoneNumber = [NSString stringWithFormat:@"133 7777 998%ld",index];
        [mu addObject:obj];
    }

    MTAlertTable *alertTable = [[MTAlertTable alloc] initWithTableDataSource:mu];
    alertTable.tableDidselect = ^(MTAlertObj *obj) {
        NSLog(@"--点击了  %@ number = %@",obj.ID,obj.phoneNumber);
    };
    [alertTable tableShow];
}
@end
