//
//  TYA_total_of.m
//  theCustomKeyboard
//
//  Created by 汤义 on 15/11/13.
//  Copyright © 2015年 汤义. All rights reserved.
//

#import "TYA_total_of.h"

@implementation TYA_total_of
+(NSArray*)addSorting
{
    NSArray *sortArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    sortArray = [sortArray sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2) {
        return (arc4random() % 2) - 1;
    }];
    return sortArray;
    
}
+(int)addSeconds
{
    NSDate *dates = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"ss"];
    NSString *timestamp = [formatter stringFromDate:dates];
    int datas = [timestamp intValue];
    //    NSLog(@"interval:%@",timestamp);
    return datas;
}
@end
