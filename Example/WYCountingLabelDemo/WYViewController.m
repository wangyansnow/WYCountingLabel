//
//  WYViewController.m
//  WYCountingLabelDemo
//
//  Created by wangyansnow on 04/01/2017.
//  Copyright (c) 2017 wangyansnow. All rights reserved.
//

#import "WYViewController.h"
#import "WYCountingLabel.h"

@interface WYViewController ()

@property (weak, nonatomic) IBOutlet WYCountingLabel *xibLabel;

@end

@implementation WYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.xibLabel.wy_number = 30;
    
}


- (IBAction)startAnimateBtnClick:(UIButton *)sender {
    static int plusNumber = 1340;
    
    [self.xibLabel setWy_FormatBlock:^NSString *(double wy_number) {
        NSString *str = [NSString stringWithFormat:@"%.2f", wy_number];
        return [self addComma:str];
    }];
    
    self.xibLabel.wy_number += plusNumber;
}

- (IBAction)timeBtnClick:(UIButton *)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"wy_number"];
    animation.duration = 3;
    animation.toValue = @0;
    
    self.xibLabel.wy_FormatBlock = nil;
    [self.xibLabel.animateLayer addAnimation:animation forKey:@"wy_number"];
}


- (NSString *)addComma:(NSString *)string {
    NSRange dotRange = [string rangeOfString:@"."];
    NSString *withoutDotStr;
    if (dotRange.length > 0) { // 有小数点
        NSUInteger location = dotRange.location;
        if (location == 0) {
            return string;
        }
        withoutDotStr = [string substringToIndex:location];
    }
    
    // 已经去除掉小数点
    NSUInteger length = withoutDotStr.length;
    if (length < 4) {
        return string;
    }
    
    NSUInteger dotNumber = length / 3;
    NSUInteger headOffset = length % 3;
    
    NSMutableString *strM = [NSMutableString stringWithString:string];
    if (headOffset != 0) {
        [strM insertString:@"," atIndex:headOffset];
    }
    
    for (int i = 1; i< dotNumber; i++){
        NSUInteger index = i * 3 + headOffset;
        [strM insertString:@"，" atIndex:index];
    }
    
    return strM.copy;
}

@end
