//
//  PlaceMapAnnotation.m
//  Travel
//
//  Created by gckj on 12-3-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PlaceMapAnnotation.h"

@implementation PlaceMapAnnotation

@synthesize place = _place;
@synthesize coordinate;
@synthesize title = _title;

- (void)dealloc
{
    [_place release];
    [_title release];
    [super dealloc];
}

- (id)initWithPlace:(Place *)place
{
    self.place = place;
    self.title = place.name;
    coordinate.longitude = place.longitude;
    coordinate.latitude = place.latitude;
    return self;
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coord;
{
    coordinate.longitude = coord.longitude;
    coordinate.latitude = coord.latitude;
    return self;
}


@end
