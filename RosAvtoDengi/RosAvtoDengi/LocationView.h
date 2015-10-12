//
//  LocationView.h
//  RosAvtoDengi
//
//  Created by Viktor on 08.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CustomAnnotation.h"

@interface LocationView : UIViewController
{
    BOOL isCurrentLocathion;
    
    BOOL sochi;
    BOOL stavropol;
    BOOL krasnodar;
    
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager * locationManager;
@property (nonatomic, strong) CLLocation * currentLocation;

@end
