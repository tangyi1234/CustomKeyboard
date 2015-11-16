//
//  TYTextField.m
//  theCustomKeyboard
//
//  Created by 汤义 on 15/11/13.
//  Copyright © 2015年 汤义. All rights reserved.
//

#import "TYTextField.h"
@interface TYTextField ()
@property (nonatomic, strong) NSMutableString *str;
@property (nonatomic, strong) UITextField *textField;
@end
@implementation TYTextField
-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}
+(void)setTextFieldView:(UIViewController *)view textField:(UITextField *)textField{
    TYTextField *views = [[TYTextField alloc] init];
    [view.view addSubview:views];
    [views addSubview:textField];
}
-(void)textField:(UITextField *)textField{
    _textField = textField;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:) name:@"tongzhi" object:nil];
}
- (void)tongzhi:(NSNotification *)text{
    NSLog(@"%@",text.userInfo[@"12355"]);
    
    if (!_str) {
        _str = [[NSMutableString alloc] init];
    }
    NSString *string = [NSString stringWithFormat:@"%@",text.userInfo[@"12355"]];
    if ([string intValue] == 10) {
        int ss = (int)_str.length;
        if (ss != 0) {
            //NSMakeRange(第几位开始,几位)
            NSRange range = NSMakeRange(ss - 1,1);
            [_str deleteCharactersInRange:range];
            _textField.text = _str;
        }
        
    }else{
        // 设置字符串内容
        [_str appendString:text.userInfo[@"12355"]];
        _textField.text = _str;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
