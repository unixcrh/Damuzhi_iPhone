// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class CityArea;
@class CityArea_Builder;
@class CityOverview;
@class CityOverview_Builder;
@class CitySubArea;
@class CitySubArea_Builder;
@class CommonOverview;
@class CommonOverview_Builder;

@interface CityOverviewRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface CommonOverview : PBGeneratedMessage {
@private
  BOOL hasHtml_:1;
  NSString* html;
  NSMutableArray* mutableImagesList;
}
- (BOOL) hasHtml;
@property (readonly, retain) NSString* html;
- (NSArray*) imagesList;
- (NSString*) imagesAtIndex:(int32_t) index;

+ (CommonOverview*) defaultInstance;
- (CommonOverview*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (CommonOverview_Builder*) builder;
+ (CommonOverview_Builder*) builder;
+ (CommonOverview_Builder*) builderWithPrototype:(CommonOverview*) prototype;

+ (CommonOverview*) parseFromData:(NSData*) data;
+ (CommonOverview*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CommonOverview*) parseFromInputStream:(NSInputStream*) input;
+ (CommonOverview*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CommonOverview*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (CommonOverview*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface CommonOverview_Builder : PBGeneratedMessage_Builder {
@private
  CommonOverview* result;
}

- (CommonOverview*) defaultInstance;

- (CommonOverview_Builder*) clear;
- (CommonOverview_Builder*) clone;

- (CommonOverview*) build;
- (CommonOverview*) buildPartial;

- (CommonOverview_Builder*) mergeFrom:(CommonOverview*) other;
- (CommonOverview_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (CommonOverview_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (NSArray*) imagesList;
- (NSString*) imagesAtIndex:(int32_t) index;
- (CommonOverview_Builder*) replaceImagesAtIndex:(int32_t) index with:(NSString*) value;
- (CommonOverview_Builder*) addImages:(NSString*) value;
- (CommonOverview_Builder*) addAllImages:(NSArray*) values;
- (CommonOverview_Builder*) clearImagesList;

- (BOOL) hasHtml;
- (NSString*) html;
- (CommonOverview_Builder*) setHtml:(NSString*) value;
- (CommonOverview_Builder*) clearHtml;
@end

@interface CitySubArea : PBGeneratedMessage {
@private
  BOOL hasSubAreaId_:1;
  BOOL hasAreaName_:1;
  NSString* subAreaId;
  NSString* areaName;
}
- (BOOL) hasSubAreaId;
- (BOOL) hasAreaName;
@property (readonly, retain) NSString* subAreaId;
@property (readonly, retain) NSString* areaName;

+ (CitySubArea*) defaultInstance;
- (CitySubArea*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (CitySubArea_Builder*) builder;
+ (CitySubArea_Builder*) builder;
+ (CitySubArea_Builder*) builderWithPrototype:(CitySubArea*) prototype;

+ (CitySubArea*) parseFromData:(NSData*) data;
+ (CitySubArea*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CitySubArea*) parseFromInputStream:(NSInputStream*) input;
+ (CitySubArea*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CitySubArea*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (CitySubArea*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface CitySubArea_Builder : PBGeneratedMessage_Builder {
@private
  CitySubArea* result;
}

- (CitySubArea*) defaultInstance;

- (CitySubArea_Builder*) clear;
- (CitySubArea_Builder*) clone;

- (CitySubArea*) build;
- (CitySubArea*) buildPartial;

- (CitySubArea_Builder*) mergeFrom:(CitySubArea*) other;
- (CitySubArea_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (CitySubArea_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasSubAreaId;
- (NSString*) subAreaId;
- (CitySubArea_Builder*) setSubAreaId:(NSString*) value;
- (CitySubArea_Builder*) clearSubAreaId;

- (BOOL) hasAreaName;
- (NSString*) areaName;
- (CitySubArea_Builder*) setAreaName:(NSString*) value;
- (CitySubArea_Builder*) clearAreaName;
@end

@interface CityArea : PBGeneratedMessage {
@private
  BOOL hasAreaId_:1;
  BOOL hasAreaName_:1;
  NSString* areaId;
  NSString* areaName;
  NSMutableArray* mutableSubAreaListList;
}
- (BOOL) hasAreaId;
- (BOOL) hasAreaName;
@property (readonly, retain) NSString* areaId;
@property (readonly, retain) NSString* areaName;
- (NSArray*) subAreaListList;
- (NSString*) subAreaListAtIndex:(int32_t) index;

+ (CityArea*) defaultInstance;
- (CityArea*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (CityArea_Builder*) builder;
+ (CityArea_Builder*) builder;
+ (CityArea_Builder*) builderWithPrototype:(CityArea*) prototype;

+ (CityArea*) parseFromData:(NSData*) data;
+ (CityArea*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CityArea*) parseFromInputStream:(NSInputStream*) input;
+ (CityArea*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CityArea*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (CityArea*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface CityArea_Builder : PBGeneratedMessage_Builder {
@private
  CityArea* result;
}

- (CityArea*) defaultInstance;

- (CityArea_Builder*) clear;
- (CityArea_Builder*) clone;

- (CityArea*) build;
- (CityArea*) buildPartial;

- (CityArea_Builder*) mergeFrom:(CityArea*) other;
- (CityArea_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (CityArea_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasAreaId;
- (NSString*) areaId;
- (CityArea_Builder*) setAreaId:(NSString*) value;
- (CityArea_Builder*) clearAreaId;

- (BOOL) hasAreaName;
- (NSString*) areaName;
- (CityArea_Builder*) setAreaName:(NSString*) value;
- (CityArea_Builder*) clearAreaName;

- (NSArray*) subAreaListList;
- (NSString*) subAreaListAtIndex:(int32_t) index;
- (CityArea_Builder*) replaceSubAreaListAtIndex:(int32_t) index with:(NSString*) value;
- (CityArea_Builder*) addSubAreaList:(NSString*) value;
- (CityArea_Builder*) addAllSubAreaList:(NSArray*) values;
- (CityArea_Builder*) clearSubAreaListList;
@end

@interface CityOverview : PBGeneratedMessage {
@private
  BOOL hasCityBasic_:1;
  BOOL hasTravelPrepration_:1;
  BOOL hasTravelUtility_:1;
  BOOL hasTravelTransportation_:1;
  CommonOverview* cityBasic;
  CommonOverview* travelPrepration;
  CommonOverview* travelUtility;
  CommonOverview* travelTransportation;
  NSMutableArray* mutableAreaListList;
}
- (BOOL) hasCityBasic;
- (BOOL) hasTravelPrepration;
- (BOOL) hasTravelUtility;
- (BOOL) hasTravelTransportation;
@property (readonly, retain) CommonOverview* cityBasic;
@property (readonly, retain) CommonOverview* travelPrepration;
@property (readonly, retain) CommonOverview* travelUtility;
@property (readonly, retain) CommonOverview* travelTransportation;
- (NSArray*) areaListList;
- (CityArea*) areaListAtIndex:(int32_t) index;

+ (CityOverview*) defaultInstance;
- (CityOverview*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (CityOverview_Builder*) builder;
+ (CityOverview_Builder*) builder;
+ (CityOverview_Builder*) builderWithPrototype:(CityOverview*) prototype;

+ (CityOverview*) parseFromData:(NSData*) data;
+ (CityOverview*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CityOverview*) parseFromInputStream:(NSInputStream*) input;
+ (CityOverview*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CityOverview*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (CityOverview*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface CityOverview_Builder : PBGeneratedMessage_Builder {
@private
  CityOverview* result;
}

- (CityOverview*) defaultInstance;

- (CityOverview_Builder*) clear;
- (CityOverview_Builder*) clone;

- (CityOverview*) build;
- (CityOverview*) buildPartial;

- (CityOverview_Builder*) mergeFrom:(CityOverview*) other;
- (CityOverview_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (CityOverview_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCityBasic;
- (CommonOverview*) cityBasic;
- (CityOverview_Builder*) setCityBasic:(CommonOverview*) value;
- (CityOverview_Builder*) setCityBasicBuilder:(CommonOverview_Builder*) builderForValue;
- (CityOverview_Builder*) mergeCityBasic:(CommonOverview*) value;
- (CityOverview_Builder*) clearCityBasic;

- (BOOL) hasTravelPrepration;
- (CommonOverview*) travelPrepration;
- (CityOverview_Builder*) setTravelPrepration:(CommonOverview*) value;
- (CityOverview_Builder*) setTravelPreprationBuilder:(CommonOverview_Builder*) builderForValue;
- (CityOverview_Builder*) mergeTravelPrepration:(CommonOverview*) value;
- (CityOverview_Builder*) clearTravelPrepration;

- (BOOL) hasTravelUtility;
- (CommonOverview*) travelUtility;
- (CityOverview_Builder*) setTravelUtility:(CommonOverview*) value;
- (CityOverview_Builder*) setTravelUtilityBuilder:(CommonOverview_Builder*) builderForValue;
- (CityOverview_Builder*) mergeTravelUtility:(CommonOverview*) value;
- (CityOverview_Builder*) clearTravelUtility;

- (BOOL) hasTravelTransportation;
- (CommonOverview*) travelTransportation;
- (CityOverview_Builder*) setTravelTransportation:(CommonOverview*) value;
- (CityOverview_Builder*) setTravelTransportationBuilder:(CommonOverview_Builder*) builderForValue;
- (CityOverview_Builder*) mergeTravelTransportation:(CommonOverview*) value;
- (CityOverview_Builder*) clearTravelTransportation;

- (NSArray*) areaListList;
- (CityArea*) areaListAtIndex:(int32_t) index;
- (CityOverview_Builder*) replaceAreaListAtIndex:(int32_t) index with:(CityArea*) value;
- (CityOverview_Builder*) addAreaList:(CityArea*) value;
- (CityOverview_Builder*) addAllAreaList:(NSArray*) values;
- (CityOverview_Builder*) clearAreaListList;
@end
