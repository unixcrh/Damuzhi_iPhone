//
//  NearByRecommendController.m
//  Travel
//
//  Created by gckj on 12-4-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NearByRecommendController.h"
#import "PlaceMapAnnotation.h"
#import "Place.pb.h"
#import "CommonPlaceDetailController.h"
#import "AppUtils.h"

@implementation NearByRecommendController

@synthesize mapView;
@synthesize locationManager = _locationManager;
@synthesize placeList = _placeList;
@synthesize mapAnnotations;
@synthesize indexOfSelectedPlace;
@synthesize superController;

- (BOOL)isRightLatitude:(CGFloat)latitude Longitude:(CGFloat)longitude
{
    if (-90.0 <= latitude && latitude <= 90.0 &&  -180.0 <= longitude && longitude <= 180.0){
        return  YES;
    }else {
        return NO;
    }
}

- (void)gotoLocation:(Place*)place
{
    if (![self isRightLatitude:[place latitude] Longitude:[place longitude]]) {
        return;
    }
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = [place latitude];
    newRegion.center.longitude = [place longitude];
    //设置地图的范围，越小越精确  
    //    newRegion.span.latitudeDelta = 0.05;
    //    newRegion.span.longitudeDelta = 0.05;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    [self.mapView setRegion:newRegion animated:YES];
}

- (void) loadAllAnnotations
{    
    [self.mapAnnotations removeAllObjects];
    if (_placeList && _placeList.count > 0) {
        for (Place *place in _placeList) {
            if ([self isRightLatitude:[place latitude] Longitude:[place longitude]]) {
                PlaceMapAnnotation *placeAnnotation = [[[PlaceMapAnnotation alloc]initWithPlace:place]autorelease];
                [self.mapAnnotations addObject:placeAnnotation];
//                NSLog(@"******load Annotations for coordinate: %f,%f",[place latitude],[place longitude]);
            }
        } 
    }
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:self.mapAnnotations];
    
}

- (void)setPlaces:(NSArray*)placeList
{
    self.placeList = placeList;
    [self loadAllAnnotations];
}

- (void)setPlaces:(NSArray*)placeList selectedIndex:(NSInteger)index
{
    self.placeList = placeList;
    self.indexOfSelectedPlace = index;
    [self loadAllAnnotations];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;   
    //    self.mapView.showsUserLocation = YES;
    self.mapAnnotations = [[NSMutableArray alloc]init];
    [self loadAllAnnotations];
    
    [self setNavigationLeftButton:NSLS(@"返回") 
                        imageName:@"back.png"
                           action:@selector(clickBack:)];
    
    [self.navigationItem setTitle:NSLS(@"周边推荐")];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//The event handling method
- (void)notationAction:(id)sender
{        
    UIButton *button = sender;
    NSInteger index = button.tag;
    CommonPlaceDetailController *controller = [[CommonPlaceDetailController alloc]initWithPlace:[_placeList objectAtIndex:index]];
    [self.superController.navigationController pushViewController:controller animated:YES];
    [controller release];
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // handle our custom annotations
    if([annotation isKindOfClass:[PlaceMapAnnotation class]])
    {
        // try to dequeue an existing pin view first
        static NSString* annotationIdentifier = @"mapAnnotationIdentifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)[[mapView dequeueReusableAnnotationViewWithIdentifier:[annotation title]]autorelease];
        if (pinView == nil)
        {
            MKAnnotationView* annotationView = [[[MKAnnotationView alloc]
                                                 initWithAnnotation:annotation reuseIdentifier:annotationIdentifier] autorelease];
            PlaceMapAnnotation *placeAnnotation = (PlaceMapAnnotation*)annotation;
            UIButton *customizeView ;
            [customizeView setBackgroundColor:[UIColor clearColor]];
            
            
            if ([self.placeList indexOfObject:placeAnnotation.place] == indexOfSelectedPlace ) {
                customizeView = [[UIButton alloc] initWithFrame:CGRectMake(0,0,102,27)];

                UIImage *image = [UIImage imageNamed:@"map_button"];
                annotationView.image = image;            
                
                UIButton *leftIndicatorButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 1.5, 13, 17)];            
                
                NSString *destinationDir = [AppUtils getCategoryImageDir];
                NSString *fileName = [[NSString alloc] initWithFormat:@"%d.png",placeAnnotation.place.categoryId];
                UIImage *icon = [[UIImage alloc] initWithContentsOfFile:[destinationDir stringByAppendingPathComponent:fileName]];
                
                [leftIndicatorButton setBackgroundImage:icon forState:UIControlStateNormal];
                [leftIndicatorButton addTarget:self action:@selector(notationAction:) forControlEvents:UIControlEventTouchUpInside];
                [customizeView addSubview:leftIndicatorButton];
                [leftIndicatorButton release];
                [icon release];
                
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, 80, 17)];
                label.font = [UIFont systemFontOfSize:12];
                label.text  = [placeAnnotation.place name];
                NSInteger value = [self.placeList indexOfObject:placeAnnotation.place];
                label.textColor = [UIColor colorWithWhite:255.0 alpha:1.0];
                label.backgroundColor = [UIColor clearColor];
                [customizeView addSubview:label];
                [label release];
                
                customizeView.tag = value;
                [customizeView addTarget:self action:@selector(notationAction:) forControlEvents:UIControlEventTouchUpInside]; 
            }
            else
            {
                NSInteger value = [self.placeList indexOfObject:placeAnnotation.place];

                customizeView = [[UIButton alloc] initWithFrame:CGRectMake(0,0,13,17)];
                
                UIImage *image = [UIImage imageNamed:@"red_star"];
                annotationView.image = image; 
                customizeView.tag = value;
                [customizeView addTarget:self action:@selector(notationAction:) forControlEvents:UIControlEventTouchUpInside];
                

            }
                        
            [annotationView addSubview:customizeView];
            [customizeView release];
            return annotationView;
        }
        else
        {
            pinView.annotation = annotation;
            
        }
        return pinView;
        
    }
    
    return nil;
}


@end
