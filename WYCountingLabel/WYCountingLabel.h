//
//  WYCountingLabel.h
//  WYCountingLabel
//
//  Created by 王俨 on 2017/4/14.
//  Copyright © 2017年 com.minyan.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYCountingLabel : UILabel

@property (nonatomic, assign) double wy_number;
@property (nonatomic, copy) NSString *(^wy_FormatBlock)(double wy_number);

- (void)wy_countFrom:(double)startNumber to:(double)endNumber duration:(NSTimeInterval)duration;

- (void)wy_updateLabelText:(double)number;

@end
