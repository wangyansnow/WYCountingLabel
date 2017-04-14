//
//  WYCountingLabel.m
//  WYCountingLabel
//
//  Created by 王俨 on 2017/4/14.
//  Copyright © 2017年 com.minyan.www. All rights reserved.
//

#import "WYCountingLabel.h"
#import "WYCountingLayer.h"

@interface WYCountingLabel() <CAAnimationDelegate>

@property (nonatomic, strong) WYCountingLayer *countingLayer;
@property (nonatomic, assign) double endNumber;

@end

@implementation WYCountingLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupLayer];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupLayer];
}

- (void)setupLayer {
    self.countingLayer = [WYCountingLayer layer];
    self.countingLayer.ownerLabel = self;
    self.countingLayer.frame = self.bounds;
    
    [self.layer addSublayer:_countingLayer];
}

- (void)setWy_number:(double)wy_number {
    _wy_number = wy_number;
    
    self.countingLayer.wy_number = wy_number;
}

- (void)wy_countFrom:(double)startNumber to:(double)endNumber duration:(NSTimeInterval)duration {
    
    self.endNumber = endNumber;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:WYAnimationKey];
    animation.fromValue = @(startNumber);
    animation.toValue = @(endNumber);
    animation.duration = duration;
    animation.delegate = self;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.countingLayer addAnimation:animation forKey:WYAnimationKey];
}

- (void)wy_updateLabelText:(double)number {
    self.text = [NSString stringWithFormat:@"%.f", number];
    if (self.wy_FormatBlock) {
        self.text = self.wy_FormatBlock(number);
    }
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag {
    if ([anim.keyPath isEqualToString:WYAnimationKey]) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.wy_number = self.endNumber;
        [CATransaction commit];
        
        [self.countingLayer removeAnimationForKey:WYAnimationKey];
    }
}



@end
