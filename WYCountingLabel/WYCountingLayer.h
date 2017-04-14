//
//  WYCountingLayer.h
//  WYCountingLabel
//
//  Created by 王俨 on 2017/4/14.
//  Copyright © 2017年 com.minyan.www. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

extern NSString *const WYAnimationKey;

@class WYCountingLabel;
@interface WYCountingLayer : CALayer

@property (nonatomic, weak) WYCountingLabel *ownerLabel;
@property (nonatomic, assign) double wy_number;

@end
