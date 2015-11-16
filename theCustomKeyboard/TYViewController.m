//
//  TYViewController.m
//  theCustomKeyboard
//
//  Created by 汤义 on 15/11/13.
//  Copyright © 2015年 汤义. All rights reserved.
//

#import "TYViewController.h"
#import "eader.h"
#import "YYKeyboardView+TY.h"
#import "YYKeyboardView.h"
#import "TYTextField.h"
@interface TYViewController ()<UITextFieldDelegate>
@property(nonatomic, strong)UITextField *TextField;
@property(nonatomic, strong)NSMutableString *str;
@end

@implementation TYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _TextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, Width - 40, 50)];
    _TextField.backgroundColor = [UIColor redColor];
    _TextField.delegate = self;
    [self.view addSubview:_TextField];
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
            _TextField.text = _str;
        }
        
    }else{
        // 设置字符串内容
        [_str appendString:text.userInfo[@"12355"]];
        _TextField.text = _str;
    }
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [YYKeyboardView addKeyboardView];
    [YYKeyboardView addKeyboardJump];
    [[[UIApplication sharedApplication] keyWindow] endEditing:NO];
    //开始编辑时触发，文本字段将成为first responder
    
}  
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:@"tongzhi" name:nil object:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
