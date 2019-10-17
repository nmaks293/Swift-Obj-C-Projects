//
//  BlackJack.m
//  BlackJack
//
//  Created by Никита Максаковский on 17/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "BlackJack.h"
#import "Card.h"
#import "Game.h"

@implementation BlackJack
-(instancetype)init{
    self=[super init];
    return self;
}

-(void)resume{
    Game *game=[Game new];
    [game startGame];
    
    if([game iHaveBlackJack]){
        NSLog(@"Good job! You have black jack, You won!");
        return;
    }
    
    NSLog(@"Do you want one more card?y/n\n");
    NSString *answer=[self getInput];
    while([answer isEqual:@"y"]){
        [game hitMe];
        if([game iHaveBlackJack]){
            NSLog(@"Good job! You have black jack, You won!\n");
            return;
        }
        if([game iHaveMore]){
            NSLog(@"Unlucky! You have more than 21, You lost.\n");
            return;
        }
        NSLog(@"Do you want one more card?y/n\n");
        answer=[self getInput];
    }
    
    
    while([game hitDealer]){};
    
    if([game dealerHasMore]){
        [game printMy];
        [game printDealer];
        NSLog(@"Dealer has more than 21, You won!\n");
        return;
    }
    
    [game printMy];
    [game printDealer];
    
    if([game iHaveHigherScore]){
        NSLog(@"You have higher score, You won!\n");
    }
    else{
        NSLog(@"Dealer has higher score, You lost.\n");
    }
   
}

-(NSString*) getInput{
    NSFileHandle * input = NSFileHandle.fileHandleWithStandardInput;
    NSData * data = input.availableData;
    return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
            stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
}

@end
