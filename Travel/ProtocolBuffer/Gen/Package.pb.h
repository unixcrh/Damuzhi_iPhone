// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "Place.pb.h"
#import "CityOverview.pb.h"
#import "TravelTips.pb.h"
#import "App.pb.h"
#import "TouristRoute.pb.h"

@class Accommodation;
@class Accommodation_Builder;
@class Agency;
@class Agency_Builder;
@class App;
@class App_Builder;
@class Booking;
@class Booking_Builder;
@class City;
@class CityArea;
@class CityArea_Builder;
@class CityList;
@class CityList_Builder;
@class CityOverview;
@class CityOverview_Builder;
@class City_Builder;
@class CommonOverview;
@class CommonOverview_Builder;
@class CommonTravelTip;
@class CommonTravelTipList;
@class CommonTravelTipList_Builder;
@class CommonTravelTip_Builder;
@class DailySchedule;
@class DailySchedule_Builder;
@class Flight;
@class Flight_Builder;
@class HelpInfo;
@class HelpInfo_Builder;
@class NameIdPair;
@class NameIdPair_Builder;
@class Order;
@class OrderList;
@class OrderList_Builder;
@class Order_Builder;
@class Package;
@class Package_Builder;
@class Place;
@class PlaceList;
@class PlaceList_Builder;
@class PlaceMeta;
@class PlaceMeta_Builder;
@class PlaceTour;
@class PlaceTour_Builder;
@class Place_Builder;
@class RecommendedApp;
@class RecommendedApp_Builder;
@class RouteCity;
@class RouteCity_Builder;
@class RouteFeekback;
@class RouteFeekbackList;
@class RouteFeekbackList_Builder;
@class RouteFeekback_Builder;
@class TouristRoute;
@class TouristRouteList;
@class TouristRouteList_Builder;
@class TouristRoute_Builder;
@class TravelPackage;
@class TravelPackage_Builder;
@class TravelResponse;
@class TravelResponse_Builder;
@class TravelTips;
@class TravelTips_Builder;
@class UserInfo;
@class UserInfo_Builder;
typedef enum {
  LanguageTypeZhHans = 1,
  LanguageTypeZhHant = 2,
  LanguageTypeEn = 3,
} LanguageType;

BOOL LanguageTypeIsValidValue(LanguageType value);


@interface PackageRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface Package : PBGeneratedMessage {
@private
  BOOL hasCityId_:1;
  BOOL hasVersion_:1;
  BOOL hasCityName_:1;
  BOOL hasLanguage_:1;
  int32_t cityId;
  NSString* version;
  NSString* cityName;
  LanguageType language;
}
- (BOOL) hasVersion;
- (BOOL) hasCityId;
- (BOOL) hasCityName;
- (BOOL) hasLanguage;
@property (readonly, retain) NSString* version;
@property (readonly) int32_t cityId;
@property (readonly, retain) NSString* cityName;
@property (readonly) LanguageType language;

+ (Package*) defaultInstance;
- (Package*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Package_Builder*) builder;
+ (Package_Builder*) builder;
+ (Package_Builder*) builderWithPrototype:(Package*) prototype;

+ (Package*) parseFromData:(NSData*) data;
+ (Package*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Package*) parseFromInputStream:(NSInputStream*) input;
+ (Package*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Package*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Package*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Package_Builder : PBGeneratedMessage_Builder {
@private
  Package* result;
}

- (Package*) defaultInstance;

- (Package_Builder*) clear;
- (Package_Builder*) clone;

- (Package*) build;
- (Package*) buildPartial;

- (Package_Builder*) mergeFrom:(Package*) other;
- (Package_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Package_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasVersion;
- (NSString*) version;
- (Package_Builder*) setVersion:(NSString*) value;
- (Package_Builder*) clearVersion;

- (BOOL) hasCityId;
- (int32_t) cityId;
- (Package_Builder*) setCityId:(int32_t) value;
- (Package_Builder*) clearCityId;

- (BOOL) hasCityName;
- (NSString*) cityName;
- (Package_Builder*) setCityName:(NSString*) value;
- (Package_Builder*) clearCityName;

- (BOOL) hasLanguage;
- (LanguageType) language;
- (Package_Builder*) setLanguage:(LanguageType) value;
- (Package_Builder*) clearLanguage;
@end

@interface UserInfo : PBGeneratedMessage {
@private
  BOOL hasLoginType_:1;
  BOOL hasGender_:1;
  BOOL hasUserId_:1;
  BOOL hasPassword_:1;
  BOOL hasTelephone_:1;
  BOOL hasEmail_:1;
  BOOL hasNickName_:1;
  BOOL hasFullName_:1;
  BOOL hasAddress_:1;
  int32_t loginType;
  int32_t gender;
  NSString* userId;
  NSString* password;
  NSString* telephone;
  NSString* email;
  NSString* nickName;
  NSString* fullName;
  NSString* address;
}
- (BOOL) hasUserId;
- (BOOL) hasLoginType;
- (BOOL) hasPassword;
- (BOOL) hasTelephone;
- (BOOL) hasEmail;
- (BOOL) hasNickName;
- (BOOL) hasGender;
- (BOOL) hasFullName;
- (BOOL) hasAddress;
@property (readonly, retain) NSString* userId;
@property (readonly) int32_t loginType;
@property (readonly, retain) NSString* password;
@property (readonly, retain) NSString* telephone;
@property (readonly, retain) NSString* email;
@property (readonly, retain) NSString* nickName;
@property (readonly) int32_t gender;
@property (readonly, retain) NSString* fullName;
@property (readonly, retain) NSString* address;

+ (UserInfo*) defaultInstance;
- (UserInfo*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (UserInfo_Builder*) builder;
+ (UserInfo_Builder*) builder;
+ (UserInfo_Builder*) builderWithPrototype:(UserInfo*) prototype;

+ (UserInfo*) parseFromData:(NSData*) data;
+ (UserInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (UserInfo*) parseFromInputStream:(NSInputStream*) input;
+ (UserInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (UserInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (UserInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface UserInfo_Builder : PBGeneratedMessage_Builder {
@private
  UserInfo* result;
}

- (UserInfo*) defaultInstance;

- (UserInfo_Builder*) clear;
- (UserInfo_Builder*) clone;

- (UserInfo*) build;
- (UserInfo*) buildPartial;

- (UserInfo_Builder*) mergeFrom:(UserInfo*) other;
- (UserInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (UserInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasUserId;
- (NSString*) userId;
- (UserInfo_Builder*) setUserId:(NSString*) value;
- (UserInfo_Builder*) clearUserId;

- (BOOL) hasLoginType;
- (int32_t) loginType;
- (UserInfo_Builder*) setLoginType:(int32_t) value;
- (UserInfo_Builder*) clearLoginType;

- (BOOL) hasPassword;
- (NSString*) password;
- (UserInfo_Builder*) setPassword:(NSString*) value;
- (UserInfo_Builder*) clearPassword;

- (BOOL) hasTelephone;
- (NSString*) telephone;
- (UserInfo_Builder*) setTelephone:(NSString*) value;
- (UserInfo_Builder*) clearTelephone;

- (BOOL) hasEmail;
- (NSString*) email;
- (UserInfo_Builder*) setEmail:(NSString*) value;
- (UserInfo_Builder*) clearEmail;

- (BOOL) hasNickName;
- (NSString*) nickName;
- (UserInfo_Builder*) setNickName:(NSString*) value;
- (UserInfo_Builder*) clearNickName;

- (BOOL) hasGender;
- (int32_t) gender;
- (UserInfo_Builder*) setGender:(int32_t) value;
- (UserInfo_Builder*) clearGender;

- (BOOL) hasFullName;
- (NSString*) fullName;
- (UserInfo_Builder*) setFullName:(NSString*) value;
- (UserInfo_Builder*) clearFullName;

- (BOOL) hasAddress;
- (NSString*) address;
- (UserInfo_Builder*) setAddress:(NSString*) value;
- (UserInfo_Builder*) clearAddress;
@end

@interface RouteFeekbackList : PBGeneratedMessage {
@private
  NSMutableArray* mutableRouteFeekbacksList;
}
- (NSArray*) routeFeekbacksList;
- (RouteFeekback*) routeFeekbacksAtIndex:(int32_t) index;

+ (RouteFeekbackList*) defaultInstance;
- (RouteFeekbackList*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (RouteFeekbackList_Builder*) builder;
+ (RouteFeekbackList_Builder*) builder;
+ (RouteFeekbackList_Builder*) builderWithPrototype:(RouteFeekbackList*) prototype;

+ (RouteFeekbackList*) parseFromData:(NSData*) data;
+ (RouteFeekbackList*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RouteFeekbackList*) parseFromInputStream:(NSInputStream*) input;
+ (RouteFeekbackList*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RouteFeekbackList*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (RouteFeekbackList*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface RouteFeekbackList_Builder : PBGeneratedMessage_Builder {
@private
  RouteFeekbackList* result;
}

- (RouteFeekbackList*) defaultInstance;

- (RouteFeekbackList_Builder*) clear;
- (RouteFeekbackList_Builder*) clone;

- (RouteFeekbackList*) build;
- (RouteFeekbackList*) buildPartial;

- (RouteFeekbackList_Builder*) mergeFrom:(RouteFeekbackList*) other;
- (RouteFeekbackList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (RouteFeekbackList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (NSArray*) routeFeekbacksList;
- (RouteFeekback*) routeFeekbacksAtIndex:(int32_t) index;
- (RouteFeekbackList_Builder*) replaceRouteFeekbacksAtIndex:(int32_t) index with:(RouteFeekback*) value;
- (RouteFeekbackList_Builder*) addRouteFeekbacks:(RouteFeekback*) value;
- (RouteFeekbackList_Builder*) addAllRouteFeekbacks:(NSArray*) values;
- (RouteFeekbackList_Builder*) clearRouteFeekbacksList;
@end

@interface RouteFeekback : PBGeneratedMessage {
@private
  BOOL hasRouteId_:1;
  BOOL hasDate_:1;
  BOOL hasRank_:1;
  BOOL hasLoginId_:1;
  BOOL hasNickName_:1;
  BOOL hasContent_:1;
  int32_t routeId;
  int32_t date;
  int32_t rank;
  NSString* loginId;
  NSString* nickName;
  NSString* content;
}
- (BOOL) hasRouteId;
- (BOOL) hasLoginId;
- (BOOL) hasNickName;
- (BOOL) hasDate;
- (BOOL) hasRank;
- (BOOL) hasContent;
@property (readonly) int32_t routeId;
@property (readonly, retain) NSString* loginId;
@property (readonly, retain) NSString* nickName;
@property (readonly) int32_t date;
@property (readonly) int32_t rank;
@property (readonly, retain) NSString* content;

+ (RouteFeekback*) defaultInstance;
- (RouteFeekback*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (RouteFeekback_Builder*) builder;
+ (RouteFeekback_Builder*) builder;
+ (RouteFeekback_Builder*) builderWithPrototype:(RouteFeekback*) prototype;

+ (RouteFeekback*) parseFromData:(NSData*) data;
+ (RouteFeekback*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RouteFeekback*) parseFromInputStream:(NSInputStream*) input;
+ (RouteFeekback*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RouteFeekback*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (RouteFeekback*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface RouteFeekback_Builder : PBGeneratedMessage_Builder {
@private
  RouteFeekback* result;
}

- (RouteFeekback*) defaultInstance;

- (RouteFeekback_Builder*) clear;
- (RouteFeekback_Builder*) clone;

- (RouteFeekback*) build;
- (RouteFeekback*) buildPartial;

- (RouteFeekback_Builder*) mergeFrom:(RouteFeekback*) other;
- (RouteFeekback_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (RouteFeekback_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasRouteId;
- (int32_t) routeId;
- (RouteFeekback_Builder*) setRouteId:(int32_t) value;
- (RouteFeekback_Builder*) clearRouteId;

- (BOOL) hasLoginId;
- (NSString*) loginId;
- (RouteFeekback_Builder*) setLoginId:(NSString*) value;
- (RouteFeekback_Builder*) clearLoginId;

- (BOOL) hasNickName;
- (NSString*) nickName;
- (RouteFeekback_Builder*) setNickName:(NSString*) value;
- (RouteFeekback_Builder*) clearNickName;

- (BOOL) hasDate;
- (int32_t) date;
- (RouteFeekback_Builder*) setDate:(int32_t) value;
- (RouteFeekback_Builder*) clearDate;

- (BOOL) hasRank;
- (int32_t) rank;
- (RouteFeekback_Builder*) setRank:(int32_t) value;
- (RouteFeekback_Builder*) clearRank;

- (BOOL) hasContent;
- (NSString*) content;
- (RouteFeekback_Builder*) setContent:(NSString*) value;
- (RouteFeekback_Builder*) clearContent;
@end

@interface TravelResponse : PBGeneratedMessage {
@private
  BOOL hasResultCode_:1;
  BOOL hasTotalCount_:1;
  BOOL hasResultInfo_:1;
  BOOL hasPlace_:1;
  BOOL hasOverview_:1;
  BOOL hasTravelTip_:1;
  BOOL hasHelpInfo_:1;
  BOOL hasPlaceList_:1;
  BOOL hasCityList_:1;
  BOOL hasAppInfo_:1;
  BOOL hasTravelTipList_:1;
  BOOL hasUserInfo_:1;
  BOOL hasRoute_:1;
  BOOL hasRouteList_:1;
  BOOL hasRouteFeekbackList_:1;
  BOOL hasOrderList_:1;
  int32_t resultCode;
  int32_t totalCount;
  NSString* resultInfo;
  Place* place;
  CommonOverview* overview;
  CommonTravelTip* travelTip;
  HelpInfo* helpInfo;
  PlaceList* placeList;
  CityList* cityList;
  App* appInfo;
  CommonTravelTipList* travelTipList;
  UserInfo* userInfo;
  TouristRoute* route;
  TouristRouteList* routeList;
  RouteFeekbackList* routeFeekbackList;
  OrderList* orderList;
}
- (BOOL) hasResultCode;
- (BOOL) hasResultInfo;
- (BOOL) hasPlace;
- (BOOL) hasOverview;
- (BOOL) hasTravelTip;
- (BOOL) hasHelpInfo;
- (BOOL) hasPlaceList;
- (BOOL) hasCityList;
- (BOOL) hasAppInfo;
- (BOOL) hasTravelTipList;
- (BOOL) hasTotalCount;
- (BOOL) hasUserInfo;
- (BOOL) hasRoute;
- (BOOL) hasRouteList;
- (BOOL) hasRouteFeekbackList;
- (BOOL) hasOrderList;
@property (readonly) int32_t resultCode;
@property (readonly, retain) NSString* resultInfo;
@property (readonly, retain) Place* place;
@property (readonly, retain) CommonOverview* overview;
@property (readonly, retain) CommonTravelTip* travelTip;
@property (readonly, retain) HelpInfo* helpInfo;
@property (readonly, retain) PlaceList* placeList;
@property (readonly, retain) CityList* cityList;
@property (readonly, retain) App* appInfo;
@property (readonly, retain) CommonTravelTipList* travelTipList;
@property (readonly) int32_t totalCount;
@property (readonly, retain) UserInfo* userInfo;
@property (readonly, retain) TouristRoute* route;
@property (readonly, retain) TouristRouteList* routeList;
@property (readonly, retain) RouteFeekbackList* routeFeekbackList;
@property (readonly, retain) OrderList* orderList;

+ (TravelResponse*) defaultInstance;
- (TravelResponse*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (TravelResponse_Builder*) builder;
+ (TravelResponse_Builder*) builder;
+ (TravelResponse_Builder*) builderWithPrototype:(TravelResponse*) prototype;

+ (TravelResponse*) parseFromData:(NSData*) data;
+ (TravelResponse*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TravelResponse*) parseFromInputStream:(NSInputStream*) input;
+ (TravelResponse*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TravelResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (TravelResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface TravelResponse_Builder : PBGeneratedMessage_Builder {
@private
  TravelResponse* result;
}

- (TravelResponse*) defaultInstance;

- (TravelResponse_Builder*) clear;
- (TravelResponse_Builder*) clone;

- (TravelResponse*) build;
- (TravelResponse*) buildPartial;

- (TravelResponse_Builder*) mergeFrom:(TravelResponse*) other;
- (TravelResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (TravelResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasResultCode;
- (int32_t) resultCode;
- (TravelResponse_Builder*) setResultCode:(int32_t) value;
- (TravelResponse_Builder*) clearResultCode;

- (BOOL) hasResultInfo;
- (NSString*) resultInfo;
- (TravelResponse_Builder*) setResultInfo:(NSString*) value;
- (TravelResponse_Builder*) clearResultInfo;

- (BOOL) hasPlace;
- (Place*) place;
- (TravelResponse_Builder*) setPlace:(Place*) value;
- (TravelResponse_Builder*) setPlaceBuilder:(Place_Builder*) builderForValue;
- (TravelResponse_Builder*) mergePlace:(Place*) value;
- (TravelResponse_Builder*) clearPlace;

- (BOOL) hasOverview;
- (CommonOverview*) overview;
- (TravelResponse_Builder*) setOverview:(CommonOverview*) value;
- (TravelResponse_Builder*) setOverviewBuilder:(CommonOverview_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeOverview:(CommonOverview*) value;
- (TravelResponse_Builder*) clearOverview;

- (BOOL) hasTravelTip;
- (CommonTravelTip*) travelTip;
- (TravelResponse_Builder*) setTravelTip:(CommonTravelTip*) value;
- (TravelResponse_Builder*) setTravelTipBuilder:(CommonTravelTip_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeTravelTip:(CommonTravelTip*) value;
- (TravelResponse_Builder*) clearTravelTip;

- (BOOL) hasHelpInfo;
- (HelpInfo*) helpInfo;
- (TravelResponse_Builder*) setHelpInfo:(HelpInfo*) value;
- (TravelResponse_Builder*) setHelpInfoBuilder:(HelpInfo_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeHelpInfo:(HelpInfo*) value;
- (TravelResponse_Builder*) clearHelpInfo;

- (BOOL) hasPlaceList;
- (PlaceList*) placeList;
- (TravelResponse_Builder*) setPlaceList:(PlaceList*) value;
- (TravelResponse_Builder*) setPlaceListBuilder:(PlaceList_Builder*) builderForValue;
- (TravelResponse_Builder*) mergePlaceList:(PlaceList*) value;
- (TravelResponse_Builder*) clearPlaceList;

- (BOOL) hasCityList;
- (CityList*) cityList;
- (TravelResponse_Builder*) setCityList:(CityList*) value;
- (TravelResponse_Builder*) setCityListBuilder:(CityList_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeCityList:(CityList*) value;
- (TravelResponse_Builder*) clearCityList;

- (BOOL) hasAppInfo;
- (App*) appInfo;
- (TravelResponse_Builder*) setAppInfo:(App*) value;
- (TravelResponse_Builder*) setAppInfoBuilder:(App_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeAppInfo:(App*) value;
- (TravelResponse_Builder*) clearAppInfo;

- (BOOL) hasTravelTipList;
- (CommonTravelTipList*) travelTipList;
- (TravelResponse_Builder*) setTravelTipList:(CommonTravelTipList*) value;
- (TravelResponse_Builder*) setTravelTipListBuilder:(CommonTravelTipList_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeTravelTipList:(CommonTravelTipList*) value;
- (TravelResponse_Builder*) clearTravelTipList;

- (BOOL) hasTotalCount;
- (int32_t) totalCount;
- (TravelResponse_Builder*) setTotalCount:(int32_t) value;
- (TravelResponse_Builder*) clearTotalCount;

- (BOOL) hasUserInfo;
- (UserInfo*) userInfo;
- (TravelResponse_Builder*) setUserInfo:(UserInfo*) value;
- (TravelResponse_Builder*) setUserInfoBuilder:(UserInfo_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeUserInfo:(UserInfo*) value;
- (TravelResponse_Builder*) clearUserInfo;

- (BOOL) hasRoute;
- (TouristRoute*) route;
- (TravelResponse_Builder*) setRoute:(TouristRoute*) value;
- (TravelResponse_Builder*) setRouteBuilder:(TouristRoute_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeRoute:(TouristRoute*) value;
- (TravelResponse_Builder*) clearRoute;

- (BOOL) hasRouteList;
- (TouristRouteList*) routeList;
- (TravelResponse_Builder*) setRouteList:(TouristRouteList*) value;
- (TravelResponse_Builder*) setRouteListBuilder:(TouristRouteList_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeRouteList:(TouristRouteList*) value;
- (TravelResponse_Builder*) clearRouteList;

- (BOOL) hasRouteFeekbackList;
- (RouteFeekbackList*) routeFeekbackList;
- (TravelResponse_Builder*) setRouteFeekbackList:(RouteFeekbackList*) value;
- (TravelResponse_Builder*) setRouteFeekbackListBuilder:(RouteFeekbackList_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeRouteFeekbackList:(RouteFeekbackList*) value;
- (TravelResponse_Builder*) clearRouteFeekbackList;

- (BOOL) hasOrderList;
- (OrderList*) orderList;
- (TravelResponse_Builder*) setOrderList:(OrderList*) value;
- (TravelResponse_Builder*) setOrderListBuilder:(OrderList_Builder*) builderForValue;
- (TravelResponse_Builder*) mergeOrderList:(OrderList*) value;
- (TravelResponse_Builder*) clearOrderList;
@end

