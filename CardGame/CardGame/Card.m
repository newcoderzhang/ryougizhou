//
//  Card.m
//  CardGame
//
//  Created by zhoutong on 15/5/7.
//  Copyright (c) 2015年 zhoutong. All rights reserved.
//

#import "Card.h"

@implementation Card
- (instancetype)initCardWithSuit:(NSString *)suit andRank:(NSString *)rank{
    self = [super init];
    if (self) {
        //属性的初始化
        self.suit = suit;
        self.rank = rank;
        self.faceUp = NO;
        self.matched = NO;
    }
    return self;
}
+ (NSArray *)allSuit{
    return @[@"♥️",@"♠️",@"♣️",@"♦️"];
}
+ (NSArray *)allRank{
    return @[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

//重写rank和suit的set方法，加入验证
- (void)setSuit:(NSString *)suit{
    if ([[Card allSuit] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSString *)rank{
    if ([[Card allRank] containsObject:rank]) {
        _rank = rank;
    }
}
- (NSString *)cardInfo{
    return [self.suit stringByAppendingString:self.rank];
}
@end
