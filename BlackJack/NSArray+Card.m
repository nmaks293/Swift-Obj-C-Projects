//
//  NSArray+Card.m
//  BlackJack
//
//  Created by Никита Максаковский on 17/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "NSArray+Card.h"
#import "Card.h"
//добавить масть картам, 52 карты ,спрашивать про еще игру
@implementation NSArray (Card)
-(NSInteger)_calcScoreFor{
   __block NSInteger score=0,aceCount=0;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Card *card=obj;
        score+=[card score];
        if([card isAce])aceCount++;
    }];
    while(score>21&&aceCount>0){
        aceCount--;
        score-=10;
    }
    return score;
}
-(NSString*)_getCardNames{
    NSMutableString *cardNames=[[NSMutableString alloc]init];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Card *card=obj;
        [cardNames appendString:[card name]];
        [cardNames appendString:@" "];
    }];    
    return cardNames;
}

@end
