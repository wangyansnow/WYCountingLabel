//
//  WYCountingLabel.m
//  WYCountingLabelDemo
//
//  Created by 王俨 on 17/3/31.
//  Copyright © 2017年 com.minyan.www. All rights reserved.
//

#import "WYCountingLabel.h"

@interface WYCountingLabel ()

@end

@implementation WYCountingLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (void)setupUI {
    WYLayer *layer = [WYLayer layer];
    _animateLayer = layer;
    
    [self.layer addSublayer:layer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.layer addSublayer:self.animateLayer];
    self.animateLayer.frame = CGRectMake(0, 0, self.bounds.size.width + 5, self.bounds.size.height);
    self.animateLayer.ownerLabel = self;
    
    if (!self.backgroundColor) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    self.textColor = self.backgroundColor;
    [self setValue:self.backgroundColor forKey:@"textColor"];
}

- (void)setTextColor:(UIColor *)textColor {
    if (![textColor isEqual:self.backgroundColor]) {
        _originTextColor = textColor;
    }
    
    [super setTextColor:textColor];
}

- (void)setWy_number:(double)wy_number {
    _wy_number = wy_number;
    
    self.text = [NSString stringWithFormat:@"%.f", wy_number];
    if (self.wy_FormatBlock) {
        self.text = self.wy_FormatBlock(self.wy_number);
    }
}

- (void)setWy_FormatBlock:(NSString *(^)(double))wy_FormatBlock {
    _wy_FormatBlock = wy_FormatBlock;
    
    if (wy_FormatBlock) {
        self.text = wy_FormatBlock(self.wy_number);
    }
}


@end
