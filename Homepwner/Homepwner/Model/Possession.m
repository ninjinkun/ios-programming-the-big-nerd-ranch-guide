//
//  Possession.m
//  RandomPossessions
//
//  Created by Asano Satoshi on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Possession.h"

@implementation Possession
@synthesize possesionName;
@synthesize serialNumber;
@synthesize valueInDollars;
@synthesize dateCreated;
@synthesize imageKey;

+(id)randomPossession {
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny",  nil];
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Sportk", @"Mac", nil];
    
    int adjectiveIndex = rand() % randomAdjectiveList.count;
    int nounIndex = rand() % randomNounList.count;

    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex], [randomNounList objectAtIndex:nounIndex]];

    int randomValue = rand() % 100;

    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", 'O' + rand() % 10, 'A' + rand() % 26, 'O' + rand() % 10, 'A' + rand() % 26,  'O' + rand() % 10];
    Possession *newPossession = [[self alloc] initWithPossessionName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];

    return [newPossession autorelease];
}

-(id)initWithPossessionName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber {
    self = [super init];
    if (self) {
        possesionName = [name retain];
        valueInDollars = value;
        serialNumber = [sNumber retain];
        dateCreated = [[NSDate alloc] init];
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@): Worth $%d, recorded on %@", possesionName, serialNumber, valueInDollars, dateCreated];
}

-(void)dealloc {
    [possesionName release];
    [serialNumber release];
    [dateCreated release];
    [super dealloc];
}

@end
