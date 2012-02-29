//
//  SpotListFilter.m
//  Travel
//
//  Created by  on 12-2-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SpotListFilter.h"
#import "PlaceManager.h"

@implementation SpotListFilter

- (void)createFilterButtons:(UIView*)superView
{
    NSLog(@"createFilterButtons");
}

+ (NSObject<PlaceListFilterProtocol>*)createFilter
{
    SpotListFilter* filter = [[[SpotListFilter alloc] init] autorelease];
    return filter;
}

- (NSArray*)findAllPlaces
{
    return [[PlaceManager defaultManager] findAllSpots];
}

@end
