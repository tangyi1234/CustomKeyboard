//
//  YYKeyboardView.h
//  营养数据
//
//  Created by 汤义 on 15/10/13.
//  Copyright © 2015年 汤义. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^KeyboardBlock)(NSString *str);
@interface YYKeyboardView : UIView
+(void)addKeyboardView;
@property (nonatomic, strong)KeyboardBlock Keyboard;
@end
