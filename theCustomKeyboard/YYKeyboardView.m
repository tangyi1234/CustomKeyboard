//
//  YYKeyboardView.m
//  营养数据
//
//  Created by 汤义 on 15/10/13.
//  Copyright © 2015年 汤义. All rights reserved.
//

#import "YYKeyboardView.h"
#import "eader.h"
#import "TYA_total_of.h"

@implementation YYKeyboardView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, Height, Width, 250);
        self.backgroundColor = [UIColor redColor];
        [self addKeyboardButton];
    }
    return self;
}
+(void)addKeyboardView
{
    YYKeyboardView *view = [[YYKeyboardView alloc] init];
    [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:view];

}

-(void)addKeyboardButton
{
    int s = [TYA_total_of addSeconds];
    
    NSArray *arra = [TYA_total_of addSorting];
    NSLog(@"=====%d",s);
    
    for (int i = 0; i < 10; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        if (i >=0 && i < 3) {
            button.frame = CGRectMake(i * (Width/3), 0, Width/3, self.frame.size.height/4);
        }else if(i >= 3 && i <6 ){
            button.frame = CGRectMake((i - 3) * (Width/3), self.frame.size.height/4 , Width/3, self.frame.size.height/4);
        }else if(i >= 6 && i < 9){
            button.frame = CGRectMake( (i - 6) * (Width/3),(self.frame.size.height/4)*2 , Width/3, self.frame.size.height/4);
        }else{
             button.frame = CGRectMake((10 - 9) * (Width/3), (self.frame.size.height/4)*3, Width/3, self.frame.size.height/4);
        }
        button.backgroundColor = [UIColor yellowColor];
        NSString *str = [NSString stringWithFormat:@"%@",arra[i]];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitle:str forState:UIControlStateNormal];
        button.tag = [str intValue];
        [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    for (int i = 0; i < 2; i ++) {
         UIButton *buttons = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
             buttons.frame = CGRectMake((9 - 9) * (Width/3), (self.frame.size.height/4)*3, Width/3, self.frame.size.height/4);
            [buttons setTitle:@"取消" forState:UIControlStateNormal];
            buttons.tag = 10;
        }else{
            buttons.frame = CGRectMake((11 - 9) * (Width/3), (self.frame.size.height/4)*3, Width/3, self.frame.size.height/4);
            [buttons setTitle:@"确定" forState:UIControlStateNormal];
            buttons.tag = 11;
        }
        
        buttons.backgroundColor = [UIColor redColor];
//        NSString *str = [NSString stringWithFormat:@"%@",arra[i]];
        [buttons setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [buttons addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttons];
    }
}
-(void)button:(UIButton *)but
{
    if (but.tag == 11) {
        NSArray *arr = [self getCurrentVC].view.subviews;
//        for (UITransitionView ss in arr) {
//            NSLog(@"ss:%@",ss.subviews);
//        }
        NSLog(@"=======%@",arr);
        [UIView animateWithDuration:1.0 animations:^{
            self.frame = CGRectMake(0, Height, Width, 250);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
        
    }else{
        NSString *str = [NSString stringWithFormat:@"%ld",(long)but.tag];
        NSDictionary *Dictionary = @{@"12355":str};
        //创建通知
        NSNotification *notification =[NSNotification notificationWithName:@"tongzhi" object:nil userInfo:Dictionary];
        //通过通知中心发送通知
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}

- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
