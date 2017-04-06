# WYCountingLabel
<img src="https://github.com/wangyansnow/WYCountingLabel/blob/master/Example/NumberAnimation.gif" width=320 height=576>


一款使用CoreAnimation实现动画数字变动效果

## Installation

- 1.cocopods
	* pod 'WYCountingLabelDem'
- 2.手动导入
	* 将`WYCountingLabel`整个文件夹拖入项目即可
## How to use WYCountingLabel
格式化Label
```
__weak typeof(self) weakSelf = self;
WYCountingLabel plusLabel = [[WYCountingLabel alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
[self.view addSubview:plusLabel];
[plusLabel setWy_FormatBlock:^NSString *(double wy_number) {
NSString *str = [NSString stringWithFormat:@"%.2f元", wy_number];
return str;
}];
plusLabel.wy_number += 10;    
```
从一个数到另一个数的动画
```
WYCountingLabel plusLabel = [[WYCountingLabel alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
[self.view addSubview:plusLabel];
[plusLabel countFrom:0 to:1576 duration:2.0];
```
## Author

wangyansnow, 13146597377@163.com

## License

WYCountingLabelDemo is available under the MIT license. See the LICENSE file for more info.
