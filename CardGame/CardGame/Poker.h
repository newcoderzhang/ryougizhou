//
//  Poker.h
//  CardGame
//
//  Created by zhoutong on 15/5/7.
//  Copyright (c) 2015年 zhoutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
/*代表一副扑克牌，用于存储52张Card对象
 属性：使用数组NSMutableArray
 方法：重写init方法，在创建一副Poker对象时，同时创建里面包含的52张纸牌
 */
@interface Poker : NSObject
@property(nonatomic,strong)NSMutableArray * allCards;

@end
