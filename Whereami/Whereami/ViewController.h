//
//  ViewController.h
//  Whereami
//
//  Created by Asano Satoshi on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UITextField *locationTitleField;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
-(void)findLocation;
-(void)findLocation:(CLLocation *)loc;
@end
