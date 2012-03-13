//
//  main.m
//  RandomPossessions
//
//  Created by Asano Satoshi on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Possession.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            Possession *p = [Possession randomPossession];
            [items addObject:p];
        }
        for (Possession *item in items) {
            NSLog(@"%@", item);
        }
        [items release];
        items = nil;
    }
    return 0;
}

