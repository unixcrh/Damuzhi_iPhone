// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Package.pb.h"

@implementation PackageRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PackageRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [PlaceRoot registerAllExtensions:registry];
    [CityOverviewRoot registerAllExtensions:registry];
    [TravelTipsRoot registerAllExtensions:registry];
    [AppRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

BOOL LanguageTypeIsValidValue(LanguageType value) {
  switch (value) {
    case LanguageTypeZhHans:
    case LanguageTypeZhHant:
    case LanguageTypeEn:
      return YES;
    default:
      return NO;
  }
}
@interface Package ()
@property (retain) NSString* version;
@property int32_t cityId;
@property (retain) NSString* cityName;
@property LanguageType language;
@end

@implementation Package

- (BOOL) hasVersion {
  return !!hasVersion_;
}
- (void) setHasVersion:(BOOL) value {
  hasVersion_ = !!value;
}
@synthesize version;
- (BOOL) hasCityId {
  return !!hasCityId_;
}
- (void) setHasCityId:(BOOL) value {
  hasCityId_ = !!value;
}
@synthesize cityId;
- (BOOL) hasCityName {
  return !!hasCityName_;
}
- (void) setHasCityName:(BOOL) value {
  hasCityName_ = !!value;
}
@synthesize cityName;
- (BOOL) hasLanguage {
  return !!hasLanguage_;
}
- (void) setHasLanguage:(BOOL) value {
  hasLanguage_ = !!value;
}
@synthesize language;
- (void) dealloc {
  self.version = nil;
  self.cityName = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.version = @"";
    self.cityId = 0;
    self.cityName = @"";
    self.language = LanguageTypeZhHans;
  }
  return self;
}
static Package* defaultPackageInstance = nil;
+ (void) initialize {
  if (self == [Package class]) {
    defaultPackageInstance = [[Package alloc] init];
  }
}
+ (Package*) defaultInstance {
  return defaultPackageInstance;
}
- (Package*) defaultInstance {
  return defaultPackageInstance;
}
- (BOOL) isInitialized {
  if (!self.hasVersion) {
    return NO;
  }
  if (!self.hasCityId) {
    return NO;
  }
  if (!self.hasCityName) {
    return NO;
  }
  if (!self.hasLanguage) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasVersion) {
    [output writeString:1 value:self.version];
  }
  if (self.hasCityId) {
    [output writeInt32:2 value:self.cityId];
  }
  if (self.hasCityName) {
    [output writeString:3 value:self.cityName];
  }
  if (self.hasLanguage) {
    [output writeEnum:4 value:self.language];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasVersion) {
    size += computeStringSize(1, self.version);
  }
  if (self.hasCityId) {
    size += computeInt32Size(2, self.cityId);
  }
  if (self.hasCityName) {
    size += computeStringSize(3, self.cityName);
  }
  if (self.hasLanguage) {
    size += computeEnumSize(4, self.language);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (Package*) parseFromData:(NSData*) data {
  return (Package*)[[[Package builder] mergeFromData:data] build];
}
+ (Package*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Package*)[[[Package builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (Package*) parseFromInputStream:(NSInputStream*) input {
  return (Package*)[[[Package builder] mergeFromInputStream:input] build];
}
+ (Package*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Package*)[[[Package builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Package*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (Package*)[[[Package builder] mergeFromCodedInputStream:input] build];
}
+ (Package*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Package*)[[[Package builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Package_Builder*) builder {
  return [[[Package_Builder alloc] init] autorelease];
}
+ (Package_Builder*) builderWithPrototype:(Package*) prototype {
  return [[Package builder] mergeFrom:prototype];
}
- (Package_Builder*) builder {
  return [Package builder];
}
@end

@interface Package_Builder()
@property (retain) Package* result;
@end

@implementation Package_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[Package alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (Package_Builder*) clear {
  self.result = [[[Package alloc] init] autorelease];
  return self;
}
- (Package_Builder*) clone {
  return [Package builderWithPrototype:result];
}
- (Package*) defaultInstance {
  return [Package defaultInstance];
}
- (Package*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (Package*) buildPartial {
  Package* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (Package_Builder*) mergeFrom:(Package*) other {
  if (other == [Package defaultInstance]) {
    return self;
  }
  if (other.hasVersion) {
    [self setVersion:other.version];
  }
  if (other.hasCityId) {
    [self setCityId:other.cityId];
  }
  if (other.hasCityName) {
    [self setCityName:other.cityName];
  }
  if (other.hasLanguage) {
    [self setLanguage:other.language];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (Package_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (Package_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setVersion:[input readString]];
        break;
      }
      case 16: {
        [self setCityId:[input readInt32]];
        break;
      }
      case 26: {
        [self setCityName:[input readString]];
        break;
      }
      case 32: {
        int32_t value = [input readEnum];
        if (LanguageTypeIsValidValue(value)) {
          [self setLanguage:value];
        } else {
          [unknownFields mergeVarintField:4 value:value];
        }
        break;
      }
    }
  }
}
- (BOOL) hasVersion {
  return result.hasVersion;
}
- (NSString*) version {
  return result.version;
}
- (Package_Builder*) setVersion:(NSString*) value {
  result.hasVersion = YES;
  result.version = value;
  return self;
}
- (Package_Builder*) clearVersion {
  result.hasVersion = NO;
  result.version = @"";
  return self;
}
- (BOOL) hasCityId {
  return result.hasCityId;
}
- (int32_t) cityId {
  return result.cityId;
}
- (Package_Builder*) setCityId:(int32_t) value {
  result.hasCityId = YES;
  result.cityId = value;
  return self;
}
- (Package_Builder*) clearCityId {
  result.hasCityId = NO;
  result.cityId = 0;
  return self;
}
- (BOOL) hasCityName {
  return result.hasCityName;
}
- (NSString*) cityName {
  return result.cityName;
}
- (Package_Builder*) setCityName:(NSString*) value {
  result.hasCityName = YES;
  result.cityName = value;
  return self;
}
- (Package_Builder*) clearCityName {
  result.hasCityName = NO;
  result.cityName = @"";
  return self;
}
- (BOOL) hasLanguage {
  return result.hasLanguage;
}
- (LanguageType) language {
  return result.language;
}
- (Package_Builder*) setLanguage:(LanguageType) value {
  result.hasLanguage = YES;
  result.language = value;
  return self;
}
- (Package_Builder*) clearLanguage {
  result.hasLanguage = NO;
  result.language = LanguageTypeZhHans;
  return self;
}
@end

@interface TravelResponse ()
@property int32_t result;
@property (retain) Place* place;
@property (retain) CommonOverview* overview;
@property (retain) CommonTravelGuide* travelGuide;
@property (retain) HelpInfo* helpInfo;
@property (retain) PlaceList* placeList;
@property (retain) CityList* cityList;
@property (retain) App* appInfo;
@end

@implementation TravelResponse

- (BOOL) hasResult {
  return !!hasResult_;
}
- (void) setHasResult:(BOOL) value {
  hasResult_ = !!value;
}
@synthesize result;
- (BOOL) hasPlace {
  return !!hasPlace_;
}
- (void) setHasPlace:(BOOL) value {
  hasPlace_ = !!value;
}
@synthesize place;
- (BOOL) hasOverview {
  return !!hasOverview_;
}
- (void) setHasOverview:(BOOL) value {
  hasOverview_ = !!value;
}
@synthesize overview;
- (BOOL) hasTravelGuide {
  return !!hasTravelGuide_;
}
- (void) setHasTravelGuide:(BOOL) value {
  hasTravelGuide_ = !!value;
}
@synthesize travelGuide;
- (BOOL) hasHelpInfo {
  return !!hasHelpInfo_;
}
- (void) setHasHelpInfo:(BOOL) value {
  hasHelpInfo_ = !!value;
}
@synthesize helpInfo;
- (BOOL) hasPlaceList {
  return !!hasPlaceList_;
}
- (void) setHasPlaceList:(BOOL) value {
  hasPlaceList_ = !!value;
}
@synthesize placeList;
- (BOOL) hasCityList {
  return !!hasCityList_;
}
- (void) setHasCityList:(BOOL) value {
  hasCityList_ = !!value;
}
@synthesize cityList;
- (BOOL) hasAppInfo {
  return !!hasAppInfo_;
}
- (void) setHasAppInfo:(BOOL) value {
  hasAppInfo_ = !!value;
}
@synthesize appInfo;
- (void) dealloc {
  self.place = nil;
  self.overview = nil;
  self.travelGuide = nil;
  self.helpInfo = nil;
  self.placeList = nil;
  self.cityList = nil;
  self.appInfo = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = 0;
    self.place = [Place defaultInstance];
    self.overview = [CommonOverview defaultInstance];
    self.travelGuide = [CommonTravelGuide defaultInstance];
    self.helpInfo = [HelpInfo defaultInstance];
    self.placeList = [PlaceList defaultInstance];
    self.cityList = [CityList defaultInstance];
    self.appInfo = [App defaultInstance];
  }
  return self;
}
static TravelResponse* defaultTravelResponseInstance = nil;
+ (void) initialize {
  if (self == [TravelResponse class]) {
    defaultTravelResponseInstance = [[TravelResponse alloc] init];
  }
}
+ (TravelResponse*) defaultInstance {
  return defaultTravelResponseInstance;
}
- (TravelResponse*) defaultInstance {
  return defaultTravelResponseInstance;
}
- (BOOL) isInitialized {
  if (!self.hasResult) {
    return NO;
  }
  if (self.hasPlace) {
    if (!self.place.isInitialized) {
      return NO;
    }
  }
  if (self.hasOverview) {
    if (!self.overview.isInitialized) {
      return NO;
    }
  }
  if (self.hasTravelGuide) {
    if (!self.travelGuide.isInitialized) {
      return NO;
    }
  }
  if (self.hasPlaceList) {
    if (!self.placeList.isInitialized) {
      return NO;
    }
  }
  if (self.hasAppInfo) {
    if (!self.appInfo.isInitialized) {
      return NO;
    }
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasResult) {
    [output writeInt32:1 value:self.result];
  }
  if (self.hasPlace) {
    [output writeMessage:2 value:self.place];
  }
  if (self.hasOverview) {
    [output writeMessage:3 value:self.overview];
  }
  if (self.hasTravelGuide) {
    [output writeMessage:4 value:self.travelGuide];
  }
  if (self.hasHelpInfo) {
    [output writeMessage:5 value:self.helpInfo];
  }
  if (self.hasPlaceList) {
    [output writeMessage:6 value:self.placeList];
  }
  if (self.hasCityList) {
    [output writeMessage:7 value:self.cityList];
  }
  if (self.hasAppInfo) {
    [output writeMessage:8 value:self.appInfo];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasResult) {
    size += computeInt32Size(1, self.result);
  }
  if (self.hasPlace) {
    size += computeMessageSize(2, self.place);
  }
  if (self.hasOverview) {
    size += computeMessageSize(3, self.overview);
  }
  if (self.hasTravelGuide) {
    size += computeMessageSize(4, self.travelGuide);
  }
  if (self.hasHelpInfo) {
    size += computeMessageSize(5, self.helpInfo);
  }
  if (self.hasPlaceList) {
    size += computeMessageSize(6, self.placeList);
  }
  if (self.hasCityList) {
    size += computeMessageSize(7, self.cityList);
  }
  if (self.hasAppInfo) {
    size += computeMessageSize(8, self.appInfo);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TravelResponse*) parseFromData:(NSData*) data {
  return (TravelResponse*)[[[TravelResponse builder] mergeFromData:data] build];
}
+ (TravelResponse*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TravelResponse*)[[[TravelResponse builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TravelResponse*) parseFromInputStream:(NSInputStream*) input {
  return (TravelResponse*)[[[TravelResponse builder] mergeFromInputStream:input] build];
}
+ (TravelResponse*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TravelResponse*)[[[TravelResponse builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TravelResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TravelResponse*)[[[TravelResponse builder] mergeFromCodedInputStream:input] build];
}
+ (TravelResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TravelResponse*)[[[TravelResponse builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TravelResponse_Builder*) builder {
  return [[[TravelResponse_Builder alloc] init] autorelease];
}
+ (TravelResponse_Builder*) builderWithPrototype:(TravelResponse*) prototype {
  return [[TravelResponse builder] mergeFrom:prototype];
}
- (TravelResponse_Builder*) builder {
  return [TravelResponse builder];
}
@end

@interface TravelResponse_Builder()
@property (retain) TravelResponse* result;
@end

@implementation TravelResponse_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[TravelResponse alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (TravelResponse_Builder*) clear {
  self.result = [[[TravelResponse alloc] init] autorelease];
  return self;
}
- (TravelResponse_Builder*) clone {
  return [TravelResponse builderWithPrototype:result];
}
- (TravelResponse*) defaultInstance {
  return [TravelResponse defaultInstance];
}
- (TravelResponse*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (TravelResponse*) buildPartial {
  TravelResponse* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (TravelResponse_Builder*) mergeFrom:(TravelResponse*) other {
  if (other == [TravelResponse defaultInstance]) {
    return self;
  }
  if (other.hasResult) {
    [self setResult:other.result];
  }
  if (other.hasPlace) {
    [self mergePlace:other.place];
  }
  if (other.hasOverview) {
    [self mergeOverview:other.overview];
  }
  if (other.hasTravelGuide) {
    [self mergeTravelGuide:other.travelGuide];
  }
  if (other.hasHelpInfo) {
    [self mergeHelpInfo:other.helpInfo];
  }
  if (other.hasPlaceList) {
    [self mergePlaceList:other.placeList];
  }
  if (other.hasCityList) {
    [self mergeCityList:other.cityList];
  }
  if (other.hasAppInfo) {
    [self mergeAppInfo:other.appInfo];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TravelResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TravelResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 8: {
        [self setResult:[input readInt32]];
        break;
      }
      case 18: {
        Place_Builder* subBuilder = [Place builder];
        if (self.hasPlace) {
          [subBuilder mergeFrom:self.place];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setPlace:[subBuilder buildPartial]];
        break;
      }
      case 26: {
        CommonOverview_Builder* subBuilder = [CommonOverview builder];
        if (self.hasOverview) {
          [subBuilder mergeFrom:self.overview];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setOverview:[subBuilder buildPartial]];
        break;
      }
      case 34: {
        CommonTravelGuide_Builder* subBuilder = [CommonTravelGuide builder];
        if (self.hasTravelGuide) {
          [subBuilder mergeFrom:self.travelGuide];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setTravelGuide:[subBuilder buildPartial]];
        break;
      }
      case 42: {
        HelpInfo_Builder* subBuilder = [HelpInfo builder];
        if (self.hasHelpInfo) {
          [subBuilder mergeFrom:self.helpInfo];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setHelpInfo:[subBuilder buildPartial]];
        break;
      }
      case 50: {
        PlaceList_Builder* subBuilder = [PlaceList builder];
        if (self.hasPlaceList) {
          [subBuilder mergeFrom:self.placeList];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setPlaceList:[subBuilder buildPartial]];
        break;
      }
      case 58: {
        CityList_Builder* subBuilder = [CityList builder];
        if (self.hasCityList) {
          [subBuilder mergeFrom:self.cityList];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setCityList:[subBuilder buildPartial]];
        break;
      }
      case 66: {
        App_Builder* subBuilder = [App builder];
        if (self.hasAppInfo) {
          [subBuilder mergeFrom:self.appInfo];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setAppInfo:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasResult {
  return result.hasResult;
}
- (int32_t) result {
  return result.result;
}
- (TravelResponse_Builder*) setResult:(int32_t) value {
  result.hasResult = YES;
  result.result = value;
  return self;
}
- (TravelResponse_Builder*) clearResult {
  result.hasResult = NO;
  result.result = 0;
  return self;
}
- (BOOL) hasPlace {
  return result.hasPlace;
}
- (Place*) place {
  return result.place;
}
- (TravelResponse_Builder*) setPlace:(Place*) value {
  result.hasPlace = YES;
  result.place = value;
  return self;
}
- (TravelResponse_Builder*) setPlaceBuilder:(Place_Builder*) builderForValue {
  return [self setPlace:[builderForValue build]];
}
- (TravelResponse_Builder*) mergePlace:(Place*) value {
  if (result.hasPlace &&
      result.place != [Place defaultInstance]) {
    result.place =
      [[[Place builderWithPrototype:result.place] mergeFrom:value] buildPartial];
  } else {
    result.place = value;
  }
  result.hasPlace = YES;
  return self;
}
- (TravelResponse_Builder*) clearPlace {
  result.hasPlace = NO;
  result.place = [Place defaultInstance];
  return self;
}
- (BOOL) hasOverview {
  return result.hasOverview;
}
- (CommonOverview*) overview {
  return result.overview;
}
- (TravelResponse_Builder*) setOverview:(CommonOverview*) value {
  result.hasOverview = YES;
  result.overview = value;
  return self;
}
- (TravelResponse_Builder*) setOverviewBuilder:(CommonOverview_Builder*) builderForValue {
  return [self setOverview:[builderForValue build]];
}
- (TravelResponse_Builder*) mergeOverview:(CommonOverview*) value {
  if (result.hasOverview &&
      result.overview != [CommonOverview defaultInstance]) {
    result.overview =
      [[[CommonOverview builderWithPrototype:result.overview] mergeFrom:value] buildPartial];
  } else {
    result.overview = value;
  }
  result.hasOverview = YES;
  return self;
}
- (TravelResponse_Builder*) clearOverview {
  result.hasOverview = NO;
  result.overview = [CommonOverview defaultInstance];
  return self;
}
- (BOOL) hasTravelGuide {
  return result.hasTravelGuide;
}
- (CommonTravelGuide*) travelGuide {
  return result.travelGuide;
}
- (TravelResponse_Builder*) setTravelGuide:(CommonTravelGuide*) value {
  result.hasTravelGuide = YES;
  result.travelGuide = value;
  return self;
}
- (TravelResponse_Builder*) setTravelGuideBuilder:(CommonTravelGuide_Builder*) builderForValue {
  return [self setTravelGuide:[builderForValue build]];
}
- (TravelResponse_Builder*) mergeTravelGuide:(CommonTravelGuide*) value {
  if (result.hasTravelGuide &&
      result.travelGuide != [CommonTravelGuide defaultInstance]) {
    result.travelGuide =
      [[[CommonTravelGuide builderWithPrototype:result.travelGuide] mergeFrom:value] buildPartial];
  } else {
    result.travelGuide = value;
  }
  result.hasTravelGuide = YES;
  return self;
}
- (TravelResponse_Builder*) clearTravelGuide {
  result.hasTravelGuide = NO;
  result.travelGuide = [CommonTravelGuide defaultInstance];
  return self;
}
- (BOOL) hasHelpInfo {
  return result.hasHelpInfo;
}
- (HelpInfo*) helpInfo {
  return result.helpInfo;
}
- (TravelResponse_Builder*) setHelpInfo:(HelpInfo*) value {
  result.hasHelpInfo = YES;
  result.helpInfo = value;
  return self;
}
- (TravelResponse_Builder*) setHelpInfoBuilder:(HelpInfo_Builder*) builderForValue {
  return [self setHelpInfo:[builderForValue build]];
}
- (TravelResponse_Builder*) mergeHelpInfo:(HelpInfo*) value {
  if (result.hasHelpInfo &&
      result.helpInfo != [HelpInfo defaultInstance]) {
    result.helpInfo =
      [[[HelpInfo builderWithPrototype:result.helpInfo] mergeFrom:value] buildPartial];
  } else {
    result.helpInfo = value;
  }
  result.hasHelpInfo = YES;
  return self;
}
- (TravelResponse_Builder*) clearHelpInfo {
  result.hasHelpInfo = NO;
  result.helpInfo = [HelpInfo defaultInstance];
  return self;
}
- (BOOL) hasPlaceList {
  return result.hasPlaceList;
}
- (PlaceList*) placeList {
  return result.placeList;
}
- (TravelResponse_Builder*) setPlaceList:(PlaceList*) value {
  result.hasPlaceList = YES;
  result.placeList = value;
  return self;
}
- (TravelResponse_Builder*) setPlaceListBuilder:(PlaceList_Builder*) builderForValue {
  return [self setPlaceList:[builderForValue build]];
}
- (TravelResponse_Builder*) mergePlaceList:(PlaceList*) value {
  if (result.hasPlaceList &&
      result.placeList != [PlaceList defaultInstance]) {
    result.placeList =
      [[[PlaceList builderWithPrototype:result.placeList] mergeFrom:value] buildPartial];
  } else {
    result.placeList = value;
  }
  result.hasPlaceList = YES;
  return self;
}
- (TravelResponse_Builder*) clearPlaceList {
  result.hasPlaceList = NO;
  result.placeList = [PlaceList defaultInstance];
  return self;
}
- (BOOL) hasCityList {
  return result.hasCityList;
}
- (CityList*) cityList {
  return result.cityList;
}
- (TravelResponse_Builder*) setCityList:(CityList*) value {
  result.hasCityList = YES;
  result.cityList = value;
  return self;
}
- (TravelResponse_Builder*) setCityListBuilder:(CityList_Builder*) builderForValue {
  return [self setCityList:[builderForValue build]];
}
- (TravelResponse_Builder*) mergeCityList:(CityList*) value {
  if (result.hasCityList &&
      result.cityList != [CityList defaultInstance]) {
    result.cityList =
      [[[CityList builderWithPrototype:result.cityList] mergeFrom:value] buildPartial];
  } else {
    result.cityList = value;
  }
  result.hasCityList = YES;
  return self;
}
- (TravelResponse_Builder*) clearCityList {
  result.hasCityList = NO;
  result.cityList = [CityList defaultInstance];
  return self;
}
- (BOOL) hasAppInfo {
  return result.hasAppInfo;
}
- (App*) appInfo {
  return result.appInfo;
}
- (TravelResponse_Builder*) setAppInfo:(App*) value {
  result.hasAppInfo = YES;
  result.appInfo = value;
  return self;
}
- (TravelResponse_Builder*) setAppInfoBuilder:(App_Builder*) builderForValue {
  return [self setAppInfo:[builderForValue build]];
}
- (TravelResponse_Builder*) mergeAppInfo:(App*) value {
  if (result.hasAppInfo &&
      result.appInfo != [App defaultInstance]) {
    result.appInfo =
      [[[App builderWithPrototype:result.appInfo] mergeFrom:value] buildPartial];
  } else {
    result.appInfo = value;
  }
  result.hasAppInfo = YES;
  return self;
}
- (TravelResponse_Builder*) clearAppInfo {
  result.hasAppInfo = NO;
  result.appInfo = [App defaultInstance];
  return self;
}
@end

