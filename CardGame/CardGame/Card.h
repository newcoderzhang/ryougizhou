//
//  Card.h
//  CardGame
//
//  Created by zhoutong on 15/5/7.
//  Copyright (c) 2015年 zhoutong. All rights reserved.
//
/*
 描述纸牌的数据
 属性：
    花色  suit
    大小  rank
    朝向  faceUp
    匹配  matched
 */
#import <Foundation/Foundation.h>

@interface Card : NSObject
@property(nonatomic,strong)NSString *suit;
@property(nonatomic,strong)NSString *rank;
@property(nonatomic,getter=isFaceUp)BOOL faceUp;
@property(nonatomic,getter=isMatched)BOOL matched;
//牌面文字，suit和rank的组合
@property(nonatomic,strong,readonly)NSString *cardInfo;

- (instancetype)initCardWithSuit:(NSString *)suit andRank:(NSString *)rank;;
//花色
+ (NSArray *)allSuit;
//大小
+ (NSArray *)allRank;
@end
