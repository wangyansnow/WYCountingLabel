//
//  WYLayer.m
//  WYCountingLabelDemo
//
//  Created by 王俨 on 17/3/31.
//  Copyright © 2017年 com.minyan.www. All rights reserved.
//

#import "WYLayer.h"
#import <UIKit/UIKit.h>

@interface WYLayer ()

@property (nonatomic, strong) NSDictionary *wy_attr;
@property (nonatomic, assign) NSTextAlignment alignment;

@end

@implementation WYLayer

@dynamic radius;
@dynamic wy_attr;
@dynamic alignment;
@dynamic formatBlock;

- (instancetype)init {
    if (self = [super init]) {
        self.contentsScale = [UIScreen mainScreen].scale;
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"radius"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx {
    
    NSString *str = [NSString stringWithFormat:@"%.f", self.radius];
    if (self.formatBlock) {
        str = self.formatBlock(self.radius);
    }
    
    CGRect strBounds = [str boundingRectWithSize:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.wy_attr context:nil];
    CGFloat strWidth = CGRectGetWidth(strBounds);
    CGFloat strHeight = CGRectGetHeight(strBounds);
    
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    
    CGRect strRect;
    if (self.alignment == NSTextAlignmentLeft || self.alignment == NSTextAlignmentNatural) {
        strRect = CGRectMake(0, (height - strHeight) * 0.5, strWidth, strHeight);
    } else if (self.alignment == NSTextAlignmentRight) {
        strRect = CGRectMake((width - strWidth), (height - strHeight) * 0.5, strWidth, strHeight);
    } else {
        strRect = CGRectMake((width - strWidth) * 0.5, (height - strHeight) * 0.5, strWidth, strHeight);
    }
    
    
    UIGraphicsPushContext(ctx);
    [str drawInRect:strRect withAttributes:self.wy_attr];
    UIGraphicsPopContext();
}

- (void)setOwnerLabel:(UILabel *)ownerLabel {
    _ownerLabel = ownerLabel;
    
    NSRange range = NSMakeRange(0, self.ownerLabel.text.length);
    NSDictionary *attr = [self.ownerLabel.attributedText attributesAtIndex:0 effectiveRange:&range];
    NSMutableDictionary *attrM = [attr mutableCopy];
    attrM[NSForegroundColorAttributeName] = self.characterColor;
    self.wy_attr = attrM;
    
    self.alignment =  self.ownerLabel.textAlignment;
}

- (id<CAAction>)actionForKey:(NSString *)event {
    if (self.presentationLayer) {
        if ([event isEqualToString:@"radius"]) {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"radius"];
            animation.fromValue = [self.presentationLayer valueForKey:@"radius"];
            return animation;
        }
    }
    return [super actionForKey:event];
}

@end
