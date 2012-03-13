//
//  MapPoint.m
//  Whereami
//
//  Created by Asano Satoshi on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint
@synthesize title;
@synthesize coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t {
    self = [super init];
    if (self) {
        coordinate = c;
        self.title = t;
    }
    return self;
}

@end
