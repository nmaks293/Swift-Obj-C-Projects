//
//  Game.m
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "Game.h"
#import "Card.h"
#import "NSArray+Card.h"


@implementation Game
-(instancetype)init{
    self=[super init];
    if(self){
        _myCards=[NSMutableArray new];
        _dealerCards=[NSMutableArray new];
        _cards=[NSMutableArray new];
    }
    return self;
}
-(void)startGame{
    
    [self initCards];
    
    Card *card1=[_cards give];
    Card *card2=[_cards give];
    
    [_myCards addObjectsFromArray:@[card1,card2]];
    
    Card *dealerFirstCard=[_cards give];
    
    [_dealerCards addObject:dealerFirstCard];
    
    [self printMy];
    [self printDealer];
}


-(void)hitMe{
    [self.myCards addObject:[_cards give]];
    [self printMy];
    
}
-(NSInteger)_calcScoreFor:(NSMutableArray*)arr{
    return [arr _calcScoreFor];
}

-(BOOL)hitDealer{
    NSInteger dealerScore=[self _calcScoreFor:self.dealerCards];
    if(dealerScore>=17)return NO;
    
    [self.dealerCards addObject:[_cards give]];
    return YES;
}

-(BOOL) iHaveBlackJack{
    NSInteger  myScore=[self _calcScoreFor:self.myCards];
    if(myScore==21)return YES;
    return NO;
    
}
-(BOOL) dealerHasBlackJack{
    NSInteger  dealerScore=[self _calcScoreFor:self.dealerCards];
    if(dealerScore==21)return YES;
    return NO;
}
-(BOOL) iHaveMore{
    NSInteger  myScore=[self _calcScoreFor:self.myCards];
    return myScore>21;
}
-(BOOL) dealerHasMore{
    NSInteger  dScore=[self _calcScoreFor:self.dealerCards];
    return dScore>21;
}

-(BOOL)scoreEqual{
    NSInteger  myScore=[self _calcScoreFor:self.myCards];
    NSInteger  dScore=[self _calcScoreFor:self.dealerCards];
    return myScore==dScore;
}
-(BOOL)iHaveHigherScore{
    NSInteger  myScore=[self _calcScoreFor:self.myCards];
    NSInteger  dScore=[self _calcScoreFor:self.dealerCards];
    return myScore>dScore;
}
-(NSString*)_getCardNames:(NSMutableArray*)cards{
    return [cards _getCardNames];
}

-(void)printMy{
    NSLog(@"I have: %@",[self _getCardNames:self.myCards]);
    
}
-(void)printDealer{
    NSLog(@"Dealer has: %@",[self _getCardNames:self.dealerCards]);
}


-(void)initCards{
    for(int i=0;i<52;i++){
        Card *card=[[Card alloc]initWithType:i/4 Suit:i%4];
        [_cards addObject:card];
    }
    [_cards shuffle];
}

@end
