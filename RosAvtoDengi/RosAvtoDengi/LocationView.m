//
//  LocationView.m
//  RosAvtoDengi
//
//  Created by Viktor on 08.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "LocationView.h"
#import "CustomMapPinView.h"
#import "Animathion.h"

@interface LocationView () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIView* barLocationView;
@property (weak, nonatomic) IBOutlet UIButton* buttonBackLocationView;
@property (strong, nonatomic) NSArray* testArray;
@property (weak, nonatomic) IBOutlet UIButton* buttonLocathion;
@property (weak, nonatomic) IBOutlet UIButton* buttonMapSochi;
@property (weak, nonatomic) IBOutlet UIButton* buttonMapKrasnodar;
@property (weak, nonatomic) IBOutlet UILabel* labelStreet;
@property (weak, nonatomic) IBOutlet UILabel* labelNumber;

@end

@implementation LocationView

- (void)viewDidLoad
{
    [super viewDidLoad];

    isCurrentLocathion = NO;

    sochi = NO;
    krasnodar = NO;
    stavropol = NO;

    //Map---------------------------------------------------
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestAlwaysAuthorization];

    [self.locationManager startUpdatingLocation];
    self.locationManager.delegate = self;

    //Параметры кнопки buttonBack---------------------------

    [self.buttonBackLocationView addTarget:self action:@selector(backButtonLocation) forControlEvents:UIControlEventTouchUpInside];

    [self.buttonLocathion addTarget:self action:@selector(actionButtonLocation) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonMapSochi addTarget:self action:@selector(actionButtonMapSochi) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonMapKrasnodar addTarget:self action:@selector(actionButtonMapKrasnodar) forControlEvents:UIControlEventTouchUpInside];

    [self setPins];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager*)manager
    didUpdateToLocation:(CLLocation*)newLocation
           fromLocation:(CLLocation*)oldLocation
{
    
    if (!isCurrentLocathion) {
        isCurrentLocathion = YES;
        [self centerOnUserLocathion:newLocation.coordinate];
    }
}

#pragma mark - buttonsAction

- (void)backButtonLocation
{

    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)actionButtonLocation
{

    CLLocationCoordinate2D sochiLocation;

    sochiLocation.latitude = 45.05047713735383;
    sochiLocation.longitude = 41.98343753814697;

    [self centerOnUserLocathion:sochiLocation];

    if (!stavropol) {
        stavropol = YES;
        
        self.buttonLocathion.userInteractionEnabled = NO;
        self.buttonMapSochi.userInteractionEnabled = YES;
        self.buttonMapKrasnodar.userInteractionEnabled = YES;

        [Animathion animateLayer:self.labelStreet];
        [Animathion animateLayer:self.labelNumber];

        self.labelNumber.text = @"8 - 988 - 503 - 52 - 28";
        self.labelStreet.text = @"Ул. Набережная д 25";

        sochi = NO;
        krasnodar = NO;
    }
}

- (void)actionButtonMapSochi
{

    CLLocationCoordinate2D sochiLocation;

    sochiLocation.latitude = 43.59726647432552;
    sochiLocation.longitude = 39.73102167248726;

    [self centerOnUserLocathion:sochiLocation];

    if (!sochi) {
        sochi = YES;
        
        self.buttonLocathion.userInteractionEnabled = YES;
        self.buttonMapSochi.userInteractionEnabled = NO;
        self.buttonMapKrasnodar.userInteractionEnabled = YES;

        [Animathion animateLayer:self.labelStreet];
        [Animathion animateLayer:self.labelNumber];

        self.labelNumber.text = @"8 - 954 - 356 - 34 - 76";
        self.labelStreet.text = @"Ул. Садовая д 34";

        stavropol = NO;
        krasnodar = NO;
    }
}

- (void)actionButtonMapKrasnodar
{

    CLLocationCoordinate2D sochiLocation;

    sochiLocation.latitude = 45.033928157920045;
    sochiLocation.longitude = 39.01479810476303;

    [self centerOnUserLocathion:sochiLocation];

    if (!krasnodar) {

        krasnodar = YES;
        
        self.buttonLocathion.userInteractionEnabled = YES;
        self.buttonMapSochi.userInteractionEnabled = YES;
        self.buttonMapKrasnodar.userInteractionEnabled = NO;

        [Animathion animateLayer:self.labelStreet];
        [Animathion animateLayer:self.labelNumber];

        self.labelNumber.text = @"8 - 918 - 653 - 23 - 65";
        self.labelStreet.text = @"Ул. Кривенко д 56";

        stavropol = NO;
        sochi = NO;
    }
}



- (void)setPins
{

    NSNumber* STRLat = [NSNumber numberWithDouble:45.05047713735383];
    NSNumber* STRLon = [NSNumber numberWithDouble:41.98343753814697];

    NSNumber* SHOCHLat = [NSNumber numberWithDouble:43.59726647432552];
    NSNumber* SHOCHLon = [NSNumber numberWithDouble:39.73102167248726];

    NSNumber* KRDLat = [NSNumber numberWithDouble:45.033928157920045];
    NSNumber* KRDLon = [NSNumber numberWithDouble:39.01479810476303];

    NSDictionary* one = [NSDictionary dictionaryWithObjectsAndKeys:STRLat, @"Lat", STRLon, @"Lon", nil];
    NSDictionary* two = [NSDictionary dictionaryWithObjectsAndKeys:SHOCHLat, @"Lat", SHOCHLon, @"Lon", nil];
    NSDictionary* three = [NSDictionary dictionaryWithObjectsAndKeys:KRDLat, @"Lat", KRDLon, @"Lon", nil];

    NSArray* array = [[NSArray alloc] initWithObjects:one, two, three, nil];

    for (int i = 0; i < array.count; i++) {

        NSDictionary* dict = [array objectAtIndex:i];
        double lat = [[dict objectForKey:@"Lat"] doubleValue];
        double lon = [[dict objectForKey:@"Lon"] doubleValue];

        CustomAnnotation* annotation = [[CustomAnnotation alloc] initWithLatitude:lat Longitude:lon];

        [self.mapView addAnnotation:annotation];
    }
}

- (void)centerOnUserLocathion:(CLLocationCoordinate2D)coord
{

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 1000, 1000);
    [self.mapView setRegion:region animated:YES];
}

#pragma mark - MKMapViewDelegate

- (nullable MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{

    if (![annotation isKindOfClass:[MKUserLocation class]]) {

        CustomMapPinView* customPin = [[CustomMapPinView alloc] initWithImage];
        return customPin;
    }

    return nil;
}

@end
