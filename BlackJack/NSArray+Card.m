//
//  NSArray+Card.m
//  BlackJack
//
//  Created by Никита Максаковский on 17/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "NSArray+Card.h"
#import "Card.h"


@implementation NSMutableArray (Card)
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
- (void)shuffle
{
    NSUInteger count = [self count];
    if (count <= 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
       [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

-(Card*)give
{
    Card *card=[self objectAtIndex:0];
    [self removeObjectAtIndex:0];
    return card;
}

@end
