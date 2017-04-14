//
//  WYCountingLayer.m
//  WYCountingLabel
//
//  Created by 王俨 on 2017/4/14.
//  Copyright © 2017年 com.minyan.www. All rights reserved.
//

#import "WYCountingLayer.h"
#import "WYCountingLabel.h"

NSString *const WYAnimationKey = @"wy_number";

@interface WYCountingLayer ()

@end

@implementation WYCountingLayer

@dynamic ownerLabel;
@dynamic wy_number;

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:WYAnimationKey]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx {
    
    [self.ownerLabel wy_updateLabelText:self.wy_number];
}

- (id<CAAction>)actionForKey:(NSString *)event {
    if (self.presentationLayer) {
        if ([event isEqualToString:WYAnimationKey]) {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:WYAnimationKey];
            animation.fromValue = [self.presentationLayer valueForKey:WYAnimationKey];
            return animation;
        }
    }
    return [super actionForKey:event];
}



@end
