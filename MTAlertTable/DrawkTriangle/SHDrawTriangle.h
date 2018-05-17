//
//  SHDrawTriangle.h
//  MTAlertTable
//
//  Created by HaoSun on 2018/5/17.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDrawTriangle : UIView

- (instancetype)initStartPoint:(CGPoint)startPoint
                   middlePoint:(CGPoint)middlePoint
                      endPoint:(CGPoint)endPoint
                         color:(UIColor*)color ;

@end
