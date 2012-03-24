//
//  AppUtils.h
//  Travel
//
//  Created by 小涛 王 on 12-3-19.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

// App dir struct 
// -----document--------download--------001_ZhHans_1.0.zip
//                |
//                |
//                 -----zip--------001_ZhHans_1.0.zip 
//                |
//                |
//                 -----city--------1--------data--------
//                            |
//                            |
//                            ------2--------data--------

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface AppUtils

//interface for create dir
+ (NSString*)getDownloadDir;
+ (NSString*)getDownloadPath:(int)cityId;
+ (NSString*)getAppDir;
+ (NSString*)getZipDir;
+ (NSString*)getCityDir:(int)cityId;

//interface for file path
+ (NSString*)getCityoverViewFilePath:(int)cityId;
+ (NSString*)getPackageFilePath:(int)cityId;
+ (NSArray*)getPlaceFilePathList:(int)cityId;



//interface for ...
+ (NSString*)getUnzipFlag:(int)cityId;

+ (NSString*)getZipFilePath:(int)cityId;
+ (NSString*)getAppFilePath;

+ (NSString*)getProvidedServiceImageDir;

+ (BOOL)hasLocalCityData:(int)cityId;

//+ (void)downloadResource:(NSURL*)url destinationDir:(NSString*)destinationDir fileName:(NSString*)fileName;

+ (void)unzipCityZip:(int)cityId;

@end