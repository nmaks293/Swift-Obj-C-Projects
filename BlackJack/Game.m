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

@interface Game()

-(NSInteger)calcScoreFor:(NSArray*)arr;
-(NSString*)getCardNames:(NSArray*)cards;

@end

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
    for(int i=0;i<52;i++){
        [_cards addObject:@1];
    }
    
    Card *card1=[[Card alloc]init];
    Card *card2=[[Card alloc]init];
    [_myCards addObjectsFromArray:@[card1,card2]];
    
    [_dealerCards addObject:[[Card alloc] init]];
    
    [self printMy];
    [self printDealer];
}

-(void)hitMe{
    [self.myCards addObject:[[Card alloc]init]];
    [self printMy];
    
}
-(NSInteger)_calcScoreFor:(NSArray*)arr{
    return [arr _calcScoreFor];
}

-(BOOL)hitDealer{
    NSInteger dealerScore=[self _calcScoreFor:self.dealerCards];
    if(dealerScore>=17)return NO;
    
    [self.dealerCards addObject:[[Card alloc]init]];
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
-(NSString*)_getCardNames:(NSArray*)cards{
    return [cards _getCardNames];
}

-(void)printMy{
    NSLog(@"I have: %@",[self _getCardNames:self.myCards]);

}
-(void)printDealer{
    NSLog(@"Dealer has: %@",[self _getCardNames:self.dealerCards]);
}



@end
