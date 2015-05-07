//
//  Game.m
//  CardGame
//
//  Created by zhoutong on 15/5/7.
//  Copyright (c) 2015年 zhoutong. All rights reserved.
//

#import "Game.h"

@implementation Game
- (NSMutableArray *)allRadndomCard{
    if (!_allRadndomCard) {
        _allRadndomCard = [NSMutableArray array];
    }
    return _allRadndomCard;
}
//根据点击的位置，进行比对
- (void)tapCardAtIndex:(NSUInteger)index{
    //根据位置找到点选的那张牌
    //如果，这张牌面朝上，翻转即可
    //否则（背朝上）
    /*
     1.翻转牌面朝上
     2.将选中的牌与
     */
    Card *chooseCard = self.allRadndomCard[index];
    if (chooseCard.isFaceUp) {
        chooseCard.faceUp = NO;
    }else{
        chooseCard.faceUp = YES;
        for (NSUInteger i = 0 ; i < self.allRadndomCard.count; i++) {
            if (index != i) {
                Card *otherCard = self.allRadndomCard[i];
                if (otherCard.isFaceUp && !otherCard.matched) {
                    if ([chooseCard.suit isEqualToString:otherCard.suit]) {
                        chooseCard.matched = YES;
                        otherCard.matched = YES;
                        self.score += 1;
                    }else if([chooseCard.rank isEqualToString:otherCard.rank]){
                        chooseCard.matched =YES;
                        otherCard.matched = YES;
                        self.score += 3;
                    }else{
                        otherCard.faceUp = NO;
                    }
                }
            }
        }
    }
    
}

- (instancetype)initWithCardCount:(NSUInteger)count inPoker:(Poker *)poker
{
    self = [super init];
    if (self) {
        
        for (int i = 0 ; i < count; i++) {
            unsigned n = arc4random()%poker.allCards.count;
            Card *card = poker.allCards[n];
            [self.allRadndomCard addObject:card];
            [poker.allCards removeObjectAtIndex:n];
            
        }
        
    }
    return self;
}
@end
