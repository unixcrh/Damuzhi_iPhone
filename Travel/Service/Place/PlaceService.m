//
//  PlaceSevice.m
//  Travel
//
//  Created by  on 12-3-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PlaceService.h"
#import "PlaceManager.h"
#import "PPViewController.h"
#import "LogUtil.h"
#import "TravelNetworkRequest.h"
#import "Package.pb.h"
#import "AppManager.h"
#import "TravelNetworkConstants.h"
#import "AppUtils.h"
#import "UserManager.h"
#import "JSON.h"
#import "PlaceStorage.h"

#define SERACH_WORKING_QUEUE    @"SERACH_WORKING_QUEUE"

@implementation PlaceService

static PlaceService* _defaultPlaceService = nil;

@synthesize currentCityId = _currentCityId;

#pragma mark - 
#pragma mark Life Cycle Management

- (void)dealloc
{
    [_localPlaceManager release];
    [_onlinePlaceManager release];
    [super dealloc];
}

+ (PlaceService*)defaultService
{
    if (_defaultPlaceService == nil){
        _defaultPlaceService = [[PlaceService alloc] init];                
    }
    
    return _defaultPlaceService;
}

- (id)init
{
    self = [super init];
    _localPlaceManager = [[PlaceManager alloc] init];
    _onlinePlaceManager = [[PlaceManager alloc] init];
    self.currentCityId = [[AppManager defaultManager] getCurrentCityId];
    return self;
}


#pragma mark - 
#pragma mark Share Methods

typedef NSArray* (^LocalRequestHandler)(int* resultCode);
typedef NSArray* (^RemoteRequestHandler)(int* resultCode);

- (void)processLocalRemoteQuery:(PPViewController<PlaceServiceDelegate>*)viewController
                   localHandler:(LocalRequestHandler)localHandler
                  remoteHandler:(RemoteRequestHandler)remoteHandler
{
    [viewController showActivityWithText:NSLS(@"kLoadingData")];
    
    NSOperationQueue* queue = [self getOperationQueue:SERACH_WORKING_QUEUE];
    [queue cancelAllOperations];
    
    [queue addOperationWithBlock:^{
        NSArray* list = nil;
        int resultCode = 0;
        //if ([_localPlaceManager hasLocalCityData:_currentCityId] == YES){
        //if ([AppUtils hasLocalCityData:_currentCityId] == YES){
        if (NO){
            // read local data firstly               
            PPDebug(@"Has Local Data For City %@, Read Data Locally", [[AppManager defaultManager] getCityName:_currentCityId]);
            if (localHandler != NULL){
                list = localHandler(&resultCode);
            }
        }
        else{
            // if local data no exist, try to read data from remote            
            PPDebug(@"No Local Data For City %@, Read Data Remotely", [[AppManager defaultManager] getCityName:_currentCityId]);            
            if (remoteHandler != NULL){
                list = remoteHandler(&resultCode);
            }
        }
            
        dispatch_async(dispatch_get_main_queue(), ^{
            [viewController hideActivity];             
            [viewController findRequestDone:resultCode dataList:list];
        });
    }];
}

#pragma mark - 
#pragma mark Place Life Cycle Management
- (void)findPlaces:(PPViewController<PlaceServiceDelegate>*)viewController categoryId:(int)categoryId  queryType:(int)quertType
{
    LocalRequestHandler localHandler = ^NSArray *(int* resultCode) {
        [_localPlaceManager switchCity:_currentCityId];
        NSArray* list = [_localPlaceManager findPlacesByCategoryId:categoryId];   
        *resultCode = 0;
        return list;
    };
    
    LocalRequestHandler remoteHandler = ^NSArray *(int* resultCode) {
        // TODO, send network request here
        CommonNetworkOutput* output = [TravelNetworkRequest queryList:quertType cityId:_currentCityId lang:LANGUAGE_SIMPLIFIED_CHINESE]; 
        TravelResponse *travelResponse = [TravelResponse parseFromData:output.responseData];
        
        _onlinePlaceManager.placeList = [[travelResponse placeList] listList];   
        
        NSArray* list = [_onlinePlaceManager findPlacesByCategoryId:categoryId];   
        
        *resultCode = 0;
        
        return list;
    };
    
    [self processLocalRemoteQuery:viewController
                     localHandler:localHandler
                    remoteHandler:remoteHandler];
}


- (void)findAllSpots:(PPViewController<PlaceServiceDelegate>*)viewController
{
    [self findPlaces:viewController categoryId:PLACE_TYPE_SPOT queryType:OBJECT_TYPE_SPOT];
}

- (void)findAllHotels:(PPViewController<PlaceServiceDelegate>*)viewController
{
    [self findPlaces:viewController categoryId:PLACE_TYPE_HOTEL queryType:OBJECT_TYPE_HOTEL];
}

- (void)findAllRestaurants:(PPViewController<PlaceServiceDelegate>*)viewController
{
    [self findPlaces:viewController categoryId:PLACE_TYPE_RESTAURANT queryType:OBJECT_TYPE_RESTAURANT];
}

- (void)findAllShoppings:(PPViewController<PlaceServiceDelegate> *)viewController
{
    [self findPlaces:viewController categoryId:PLACE_TYPE_SHOPPING queryType:OBJECT_TYPE_SHOPPING];
}

- (void)findAllEntertainments:(PPViewController<PlaceServiceDelegate> *)viewController
{
    [self findPlaces:viewController categoryId:PLACE_TYPE_ENTERTAINMENT queryType:OBJECT_TYPE_ENTERTAINMENT];
}


- (void)findAllPlaces:(PPViewController<PlaceServiceDelegate>*)viewController
{
    
    LocalRequestHandler localHandler = ^NSArray *(int* resultCode) {
        [_localPlaceManager switchCity:_currentCityId];
        NSArray* list = [_localPlaceManager findAllPlaces];   
        *resultCode = 0;
        return list;
    };
    
    LocalRequestHandler remoteHandler = ^NSArray *(int* resultCode) {
        // TODO, send network request here
        CommonNetworkOutput* output = [TravelNetworkRequest queryList:OBJECT_TYPE_ALL_PLACE cityId:_currentCityId lang:LANGUAGE_SIMPLIFIED_CHINESE];
        TravelResponse *travelResponse = [TravelResponse parseFromData:output.responseData];
        _onlinePlaceManager.placeList = [[travelResponse placeList] listList];
        
        NSArray* list = [_onlinePlaceManager findAllPlaces];
        *resultCode = 0;
        
        return list;
    };
    
    [self processLocalRemoteQuery:viewController
                     localHandler:localHandler
                    remoteHandler:remoteHandler];    
}

- (void)findMyPlaces:(PPViewController<PlaceServiceDelegate>*)viewController
{
    
}

- (void)findHistoryPlaces:(PPViewController<PlaceServiceDelegate>*)viewController
{
    
}

- (void)addPlaceIntoFavorite:(PPViewController<PlaceServiceDelegate>*)viewController 
                       place:(Place*)place
{
    NSString* userId = [[UserManager defaultManager] userId];    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        CommonNetworkOutput* output = [TravelNetworkRequest addFavoriteByUserId:userId placeId:[NSString stringWithFormat:@"%d",place.placeId]  longitude:[NSString stringWithFormat:@"%f",place.longitude] latitude:[NSString stringWithFormat:@"%f",place.latitude]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSDictionary* jsonDict = [output.textData JSONValue];
            NSNumber *result = (NSNumber*)[jsonDict objectForKey:PARA_TRAVEL_RESULT];
            NSNumber *placeFavoriteCount = (NSNumber*)[jsonDict objectForKey:PARA_TRAVEL_PLACE_FAVORITE_COUNT];
            if (0 == result.intValue){
                    //[[PlaceStorage favoriteManager] addPlace:place];
            }else {
                PPDebug(@"<PlaceService> addPlaceIntoFavorite faild,result:%d", result.intValue);
            }
            [[PlaceStorage favoriteManager] addPlace:place];
            
            if ([viewController respondsToSelector:@selector(finishAddFavourite:count:)]){
                [viewController finishAddFavourite:result count:placeFavoriteCount.intValue];
            }
            
        });
    }); 
}

- (void)getPlaceFavoriteCount:(PPViewController<PlaceServiceDelegate>*)viewController
                      placeId:(int)placeId
{
    int count = 108; // test
    
    
    if ([viewController respondsToSelector:@selector(didGetPlaceData:count:)]){
        // Test
        PPDebug(@"<getPlaceFavoriteCount> placeId=%d, count=%d", placeId, count);
        [viewController didGetPlaceData:placeId count:count];
    }
}

//- (BOOL)isPlaceInFavorite:(int)placeId
//{ 
//    return NO;
//}

@end
