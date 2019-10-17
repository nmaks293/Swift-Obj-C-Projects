//
//  Card.m
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "Card.h"

@implementation Card
-(instancetype)init
{
    self = [super init];
    if(self){
        _type = arc4random_uniform(12);
        _suit = arc4random_uniform(3);
    }
    return self;
}
-(NSString *)name{
    NSString *card;
    switch(_type){
            
        case CardType2:
            card=@"2";
            break;
        case CardType3:
            card= @"3";
            break;
        case CardType4:
            card= @"4";
            break;
        case CardType5:
            card= @"5";
            break;
        case CardType6:
            card= @"6";
            break;
        case CardType7:
            card= @"7";
            break;
        case CardType8:
            card= @"8";
            break;
        case CardType9:
            card= @"9";
            break;
        case CardType10:
            card= @"10";
            break;
        case CardTypeJ:
            card= @"J";
            break;
        case CardTypeQ:
            card= @"Q";
            break;
        case CardTypeK:
            card=@"K";
            break;
        case CardTypeA:
            card= @"A";
            break;
    }
    switch (_suit) {
        case CardSuitC:
            card=[card stringByAppendingString:@"♣"];
            break;
        case CardSuitD:
            card=[card stringByAppendingString:@"♦"];
            break;
        case CardSuitH:
            card=[card stringByAppendingString:@"♥"];
            break;
        case CardSuitP:
            card=[card stringByAppendingString:@"♠"];
            break;
    }
    return card;
    
}

-(BOOL)isAce{
    return _type==CardTypeA;
}

-(NSInteger)score{
    switch (_type){
            
        case CardType2:
            return 2;
            break;
        case CardType3:
            return 3;
            break;
        case CardType4:
            return 4;
            break;
        case CardType5:
            return 5;
            break;
        case CardType6:
            return 6;
            break;
        case CardType7:
            return 7;
            break;
        case CardType8:
            return 8;
            break;
        case CardType9:
            return 9;
            break;
        case CardType10:
            return 10;
            break;
        case CardTypeJ:
            return 10;
            break;
        case CardTypeQ:
            return 10;
            break;
        case CardTypeK:
            return 10;
            break;
        case CardTypeA:
            return 11;
            break;
    }
    
}



@end
