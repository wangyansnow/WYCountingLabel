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

@property (weak, nonatomic) IBOutlet WYCountingLabel *plusLabel;
@property (weak, nonatomic) IBOutlet WYCountingLabel *fromLabel;

@end

@implementation WYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (IBAction)plusBtnClick:(UIButton *)sender {
    static int plusNumber = 1340;
    
    __weak typeof(self) weakSelf = self;
    [self.plusLabel setWy_FormatBlock:^NSString *(double wy_number) {
        NSString *str = [NSString stringWithFormat:@"%.2f", wy_number];
        return [weakSelf addComma:str];
    }];
    
    self.plusLabel.wy_number += plusNumber;
}

- (IBAction)fromBtnClick:(UIButton *)sender {
    [self.fromLabel wy_countFrom:0 to:1576 duration:2.0];
}

#pragma mark - private
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
        [strM insertString:@"," atIndex:index];
    }
    
    return strM.copy;
}

@end
