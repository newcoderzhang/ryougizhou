//
//  Game.h
//  CardGame
//
//  Created by zhoutong on 15/5/7.
//  Copyright (c) 2015年 zhoutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poker.h"
/*
 作用：模拟游戏类，用于提供整个游戏的游戏规则（业务模型）
 属性：存储游戏开始时，随机抽取的纸牌信息，使用NSMutableArray存储
 方法：
 （1）游戏开始时（init），根据给定的数量（count）和指定的扑克牌（poker），从中随机抽取纸牌
 （2）根据选中的牌的位置，按照指定的比对规则进行比对
 */
@interface Game : NSObject
@property(nonatomic,strong)NSMutableArray * allRadndomCard;
@property(nonatomic)NSUInteger score;

- (instancetype)initWithCardCount:(NSUInteger)count inPoker:(Poker *)poker;
- (void)tapCardAtIndex:(NSUInteger)index;
@end
