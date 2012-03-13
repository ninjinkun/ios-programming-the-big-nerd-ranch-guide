//
//  PossessionStore.m
//  Homepwner
//
//  Created by Asano Satoshi on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PossessionStore.h"
#import "Possession.h"
@interface PossessionStore () {
    NSMutableArray *_allPossessions;
}
@end

@implementation PossessionStore
static PossessionStore *defaultStore = nil;

+(PossessionStore *)defaultStore {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultStore = [[super allocWithZone:NULL] init];
    });
    return defaultStore;
}

+(id)allocWithZone:(NSZone *)zone {
    return [self defaultStore];
}

- (id)init
{
    if (defaultStore) {
        return defaultStore;
    }
    self = [super init];
    if (self) {
        _allPossessions = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)removePossession:(Possession *)p {
    [_allPossessions removeObjectIdenticalTo:p];
}

-(NSArray *)allPossessions {
    return [_allPossessions copy];
}

-(Possession *)createPossession {
    Possession *p = [Possession randomPossession];
    [_allPossessions addObject:p];
    return p;
}

@end
