//
//  ViewController.m
//  Whereami
//
//  Created by Asano Satoshi on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MapPoint.h"
@interface ViewController ()
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation ViewController
@synthesize activityIndicator;
@synthesize locationTitleField;
@synthesize mapView;
@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;    
    locationManager.delegate = self;
    mapView.showsUserLocation = YES;
    mapView.delegate = self;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    mapView.region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 250, 250);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

-(void)findLocation {
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    locationTitleField.hidden = YES;
}

-(void)findLocation:(CLLocation *)loc {
    MapPoint *point = [[MapPoint alloc] initWithCoordinate:loc.coordinate title:locationTitleField.text];
    [mapView addAnnotation:point];
    [mapView setRegion:MKCoordinateRegionMakeWithDistance(loc.coordinate, 250, 250) animated:YES];
    locationTitleField.text = @"";
    [activityIndicator stopAnimating];
    locationTitleField.hidden = NO;
    [locationManager stopUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    if (t < - 180) return;
    [self findLocation:newLocation];
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [self setLocationTitleField:nil];
    [self setActivityIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
