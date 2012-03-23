//
//  AppService.h
//  Travel
//
//  Created by 小涛 王 on 12-3-12.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import "CommonService.h"
#import "AppManager.h"

@interface AppService : CommonService

+ (AppService*)defaultService;

- (void)loadAppData;
- (void)updateAppData;

- (void)downloadCity:(City*)city;
- (void)getCityDownloadProgress:(int)cityId;

+ (void)downloadResource:(NSURL*)url destinationDir:(NSString*)destinationDir fileName:(NSString*)fileName;

@end
