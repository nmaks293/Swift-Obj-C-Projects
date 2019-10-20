//
//  main.m
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Game.h"
#import "BlackJack.h"

NSString* getInput(){
    NSFileHandle * input = NSFileHandle.fileHandleWithStandardInput;
    NSData * data = input.availableData;
    return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
            stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        do{
            BlackJack *game=[BlackJack new];
            [game resume];
            NSLog(@"Do you want play one more game?y/n \n");
            
        }while([getInput() isEqual:@"y"]);
        NSLog(@"Have a nice day!");
    }
    return 0;
}
