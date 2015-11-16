//
//  YYKeyboardView+TY.m
//  营养数据
//
//  Created by 汤义 on 15/10/14.
//  Copyright © 2015年 汤义. All rights reserved.
//

#import "YYKeyboardView+TY.h"
#import "eader.h"
@implementation YYKeyboardView (TY)
+(void)addKeyboardJump
{
    UIView *view = [YYKeyboardView TYForView:[UIApplication sharedApplication].delegate.window.rootViewController.view];
    [UIView animateWithDuration:1.0 animations:^{
        view.frame = CGRectMake(0, Height - 250, Width, 250);
    }];
}
+ (MB_INSTANCETYPE)TYForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        NSLog(@"subview:%@",subview);
        if ([subview isKindOfClass:[self class]]) {
            
            return (YYKeyboardView *)subview;
        }
    }
    return nil;
}
@end
