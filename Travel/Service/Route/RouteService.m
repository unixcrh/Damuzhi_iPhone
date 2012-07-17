//
//  RouteService.m
//  Travel
//
//  Created by 小涛 王 on 12-6-4.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import "RouteService.h"
#import "TravelNetworkRequest.h"
#import "LocaleUtils.h"
#import "PPViewController.h"
#import "SelectedItemIds.h"
#import "RouteStorage.h"
#import "UserManager.h"
#import "JSON.h"

@interface RouteService ()

@property (retain, nonatomic) NSArray *routeList;

@end

static RouteService *_defaultRouteService = nil;

@implementation RouteService

@synthesize routeList = _routeList;

#pragma mark - 
#pragma mark Life Cycle Management

- (void)dealloc
{
    [_routeList release];
    [super dealloc];
}

+ (RouteService*)defaultService
{
    if (_defaultRouteService == nil){
        _defaultRouteService = [[RouteService alloc] init];                
    }
    
    return _defaultRouteService;
}

- (void)findRoutesWithType:(int)routeType
                     start:(int)start
                     count:(int)count 
           selectedItemIds:(RouteSelectedItemIds *)selectedItemIds
            needStatistics:(BOOL)needStatistics 
            viewController:(PPViewController<RouteServiceDelegate>*)viewController
{
    [viewController showActivityWithText:NSLS(@"数据加载中......")];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CommonNetworkOutput* output = [TravelNetworkRequest queryList:routeType 
                                                                start:start 
                                                                count:count 
                                                     departCityIdList:selectedItemIds.departCityIds 
                                                destinationCityIdList:selectedItemIds.destinationCityIds 
                                                         agencyIdList:selectedItemIds.agencyIds 
                                                      priceRankIdList:selectedItemIds.priceRankItemIds
                                                      daysRangeIdList:selectedItemIds.daysRangeItemIds 
                                                          themeIdList:selectedItemIds.themeIds 
                                                         sortTypeList:selectedItemIds.sortIds 
                                                       needStatistics:needStatistics 
                                                                 lang:LanguageTypeZhHans 
                                                                 test:NO];
        
        int totalCount;
        NSArray *routeList;
        RouteStatistics *statistics;
        if (output.resultCode == ERROR_SUCCESS){
            @try{
                TravelResponse *travelResponse = [TravelResponse parseFromData:output.responseData];
            
                totalCount = [travelResponse totalCount];
                routeList = [[travelResponse routeList] routesList];
                statistics = (needStatistics == NO) ? nil : [travelResponse routeStatistics];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [viewController hideActivity];   
                    
                    if ([viewController respondsToSelector:@selector(findRequestDone:totalCount:list:statistics:)]) {
                        [viewController findRequestDone:output.resultCode 
                                             totalCount:totalCount
                                                   list:routeList
                                             statistics:statistics];
                    }
                });
            }
            @catch (NSException *exception){
                PPDebug(@"<Catch Exception in findRoutesWithType>");
            }
        }

    });    
}

- (void)findRouteWithRouteId:(int)routeId viewController:(PPViewController<RouteServiceDelegate>*)viewController

{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CommonNetworkOutput* output = [TravelNetworkRequest queryObject:OBJECT_TYPE_ROUTE_DETAIL
                                                                  objId:routeId  
                                                                 lang:LanguageTypeZhHans];
        
        TravelResponse *travelResponse = nil;
        if (output.resultCode == ERROR_SUCCESS){
            @try{
                travelResponse = [TravelResponse parseFromData:output.responseData];
                TouristRoute *route = [travelResponse route];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if ([viewController respondsToSelector:@selector(findRequestDone:route:)]) {
                        [viewController findRequestDone:travelResponse.resultCode 
                                                  route:route];
                    }
                });
            }
            @catch (NSException *exception){
            }
        }
    }); 
}

- (void)queryRouteFeekbacks:(int)routeId 
                      start:(int)start
                      count:(int)count
             viewController:(PPViewController<RouteServiceDelegate>*)viewController
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CommonNetworkOutput* output = [TravelNetworkRequest queryList:OBJECT_LIST_ROUTE_FEEKBACK routeId:routeId start:start count:count lang:LanguageTypeZhHans];
        
        int totalCount;
        TravelResponse *travelResponse = nil;
        if (output.resultCode == ERROR_SUCCESS){
            @try{
                travelResponse = [TravelResponse parseFromData:output.responseData];
                totalCount = [travelResponse totalCount];
                NSArray *list = [[travelResponse routeFeekbackList] routeFeekbacksList] ;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if ([viewController respondsToSelector:@selector(findRequestDone:totalCount:list:)]) {
                        [viewController findRequestDone:output.resultCode totalCount:totalCount list:list];
                    }
                });
            }
            @catch (NSException *exception){
            }
        }
    }); 
}

- (void)followRoute:(TouristRoute *)route 
          routeType:(int)routeType 
     viewController:(PPViewController<RouteServiceDelegate>*)viewController
{
    if (routeType == OBJECT_LIST_ROUTE_PACKAGE_TOUR) {
        [[RouteStorage packageFollowManager] addRoute:route];
    } else if (routeType == OBJECT_LIST_ROUTE_UNPACKAGE_TOUR) {
        [[RouteStorage unpackageFollowManager] addRoute:route];
    }
    
    NSString *userId = nil; 
    NSString *loginId = nil;
    NSString *token = nil;
    
    if ([[UserManager defaultManager] isLogin]) {
        loginId = [[UserManager defaultManager] loginId];
        token = [[UserManager defaultManager] token];
    }else {
        userId = [[UserManager defaultManager] getUserId];
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CommonNetworkOutput *output = [TravelNetworkRequest followRoute:userId
                                                                loginId:loginId 
                                                                  token:token 
                                                                routeId:route.routeId ];
        dispatch_async(dispatch_get_main_queue(), ^{
            int result = -1;
            NSString *resultInfo = nil;
            
            if (output.resultCode == ERROR_SUCCESS) {
                NSDictionary* jsonDict = [output.textData JSONValue];
                result = [[jsonDict objectForKey:PARA_TRAVEL_RESULT] intValue];
                resultInfo = [jsonDict objectForKey:PARA_TRAVEL_RESULT_INFO];
            }
            
            if ([viewController respondsToSelector:@selector(followRouteDone:result:resultInfo:)]) {
                [viewController followRouteDone:output.resultCode result:result resultInfo:resultInfo];
            }
        });                        
    });
}

@end
