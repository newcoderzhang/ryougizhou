//
//  Poker.m
//  CardGame
//
//  Created by zhoutong on 15/5/7.
//  Copyright (c) 2015年 zhoutong. All rights reserved.
//

#import "Poker.h"

@implementation Poker
- (id)init{
    self = [super init];
    if (self) {
        //创建52张牌，添加到allCards数组中
        for (NSString *suit in [Card allSuit]) {
            for (NSString *rank in [Card allRank]) {
                Card *card = [[Card alloc]initCardWithSuit:suit andRank:rank];
                [self.allCards addObject:card];
            }
        }
    }
    return self;
}

//懒加载，如果allCards为空，则创建
- (NSMutableArray *)allCards{
    if (!_allCards) {
        _allCards = [NSMutableArray array];
    }
    return _allCards;
}
@end
