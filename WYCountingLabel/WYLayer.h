//
//  WYLayer.h
//  WYCountingLabelDemo
//
//  Created by 王俨 on 17/3/31.
//  Copyright © 2017年 com.minyan.www. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class WYCountingLabel;
@interface WYLayer : CALayer

@property (nonatomic, weak) WYCountingLabel *ownerLabel;


@end
