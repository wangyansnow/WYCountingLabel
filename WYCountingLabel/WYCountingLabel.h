//
//  WYCountingLabel.h
//  WYCountingLabelDemo
//
//  Created by 王俨 on 17/3/31.
//  Copyright © 2017年 com.minyan.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYLayer.h"

@interface WYCountingLabel : UILabel

@property (nonatomic, assign) double wy_number;
@property (nonatomic, weak, readonly) WYLayer *animateLayer;

@property (nonatomic, copy) NSString *(^wy_FormatBlock)(double wy_number);

@end
