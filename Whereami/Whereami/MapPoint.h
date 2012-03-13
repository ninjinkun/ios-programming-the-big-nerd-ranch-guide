//
//  MapPoint.h
//  Whereami
//
//  Created by Asano Satoshi on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MapPoint : NSObject<MKAnnotation>
-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@end
