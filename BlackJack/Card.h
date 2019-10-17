//
//  Card.h
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,CardType){
    CardType2,
    CardType3,
    CardType4,
    CardType5,
    CardType6,
    CardType7,
    CardType8,
    CardType9,
    CardType10,
    CardTypeJ,
    CardTypeQ,
    CardTypeK,
    CardTypeA
};
typedef NS_ENUM(NSInteger,CardSuit){
    CardSuitH,
    CardSuitD,
    CardSuitP,
    CardSuitC
};

@interface Card : NSObject
@property(nonatomic,assign)CardType type;
@property(nonatomic,assign)CardSuit suit;

-(NSString *) name;
-(NSInteger) score;
-(BOOL) isAce;
@end

NS_ASSUME_NONNULL_END
