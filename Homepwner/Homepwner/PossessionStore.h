//
//  PossessionStore.h
//  Homepwner
//
//  Created by Asano Satoshi on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Possession;
@interface PossessionStore : NSObject
+(PossessionStore *)defaultStore;
-(NSArray *)allPossessions;
-(Possession *)createPossession;
-(void)removePossession:(Possession *)p;
@end
