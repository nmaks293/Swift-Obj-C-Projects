//
//  NSArray+Card.h
//  BlackJack
//
//  Created by Никита Максаковский on 17/10/2019.
//  Copyright © 2019 User. All rights reserved.
//


#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Card)
-(NSInteger)_calcScoreFor;
-(NSString*)_getCardNames;
-(void)shuffle;
-(Card*)give;
@end

NS_ASSUME_NONNULL_END
