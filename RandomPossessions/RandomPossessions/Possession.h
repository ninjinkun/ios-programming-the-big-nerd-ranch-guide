//
//  Possession.h
//  RandomPossessions
//
//  Created by Asano Satoshi on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject
@property (nonatomic, copy) NSString *possesionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, copy) NSDate *dateCreated;
+(id)randomPossession;
-(id)initWithPossessionName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;
@end
