//
//  GameViewController.m
//  CardGame
//
//  Created by zhoutong on 15/5/7.
//  Copyright (c) 2015年 zhoutong. All rights reserved.
//

#import "GameViewController.h"
@interface GameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
//提供一副poker
@property (strong, nonatomic)Poker *poker;
//提供一个游戏
@property (nonatomic, strong)Game *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建游戏对象
    self.game = [[Game alloc]initWithCardCount:self.buttons.count inPoker:self.poker];
    [self showCardsInfo];
}
//用于更新界面，讲model中的数据对应到按钮上
- (void)showCardsInfo{
    //遍历每一个按钮,得到按钮的坐标，根据这个坐标找到对应的纸牌，将纸牌信息显示在按钮上
    for (NSUInteger index = 0 ; index < self.buttons.count; index++) {
        Card *card = self.game.allRadndomCard[index];
        UIButton *button = self.buttons[index];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:[self imageNameForCard:card]] forState:UIControlStateNormal];
        button.enabled = !card.matched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"分数：%lu",(unsigned long)self.game.score] ;
}

//根据牌的状态返回按钮上的文字
- (NSString *)titleForCard:(Card *)card{
    return card.isFaceUp?card.cardInfo:@"";
}

//根据牌的状态返回按钮上的显示的图片的名称
- (NSString *)imageNameForCard:(Card *)card{
    return card.isFaceUp?@"IMG_0217.jpg":@"IMG_0218.jpg";
}

- (IBAction)onClickCard:(UIButton *)sender {
    //获取点击的按钮的位置
//    NSUInteger index = [self.buttons indexOfObject:sender];
    //传递位置
    [self.game tapCardAtIndex:[self.buttons indexOfObject:sender]];
    [self showCardsInfo];
    //更新界面
//    NSLog(@"%ld",(long)index);
}

- (Poker *)poker{
    if (!_poker) {
        _poker = [[Poker alloc]init];
    }
    return _poker;
}

@end
