//
//  WYLayer.h
//  WYCountingLabelDemo
//
//  Created by 王俨 on 17/3/31.
//  Copyright © 2017年 com.minyan.www. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef NSString *(^wy_FormatBlock)(double wy_number);

@interface WYLayer : CALayer

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, weak) UILabel *ownerLabel;
@property (nonatomic, strong) UIColor *characterColor;
@property (nonatomic, copy) wy_FormatBlock formatBlock;

@end
