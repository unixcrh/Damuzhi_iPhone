//
//  CityDownloadService.m
//  Travel
//
//  Created by 小涛 王 on 12-4-20.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import "CityDownloadService.h"
#import "AppUtils.h"
#import "FileUtil.h"
#import "PPDebug.h"

@implementation CityDownloadService

@synthesize operationQueue = _operationQueue;

static CityDownloadService *_instance;

+ (id)defaultService
{
    if (_instance == nil) {
        _instance = [[CityDownloadService alloc] init];
    }
    
    return _instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.operationQueue = [[NSOperationQueue alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [_operationQueue release];
    [super dealloc];
}


- (void)download:(City*)city delegate:(NSObject<LocalCityDelegate>*)delegate
{
    LocalCity *localCity = [[LocalCityManager defaultManager] createLocalCity:city.cityId];
    localCity.delegate = delegate;
    localCity.downloadType = TYPE_DOWNLOAD;
    localCity.downloadStatus = DOWNLOADING;

    NSURL *url = [NSURL URLWithString:city.downloadUrl];
    
    ASIHTTPRequest *request = [self createRequest:url localCity:localCity];
    
        
    //set request info, user defined
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:localCity
                                                         forKey:KEY_LOCAL_CITY]; 
    
    [request setUserInfo:userInfo];
    
    //add request into queue and run
    [_operationQueue addOperation:request];
}

- (void)update:(City*)city delegate:(NSObject<LocalCityDelegate>*)delegate
{
    LocalCity *localCity = [[LocalCityManager defaultManager] createLocalCity:city.cityId];
    localCity.delegate = delegate;
    localCity.downloadType = TYPE_UPDATE;
    localCity.downloadStatus = UPDATING;
    
    NSURL *url = [NSURL URLWithString:city.downloadUrl];
    
    ASIHTTPRequest *request = [self createRequest:url localCity:localCity];
    
    //set request info, user defined
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:localCity
                                                         forKey:KEY_LOCAL_CITY]; 
    
    [request setUserInfo:userInfo];
    
    //add request into queue and run
    [_operationQueue addOperation:request];
}

- (ASIHTTPRequest*)createRequest:(NSURL*)url localCity:(LocalCity*)localCity
{
    // Get destination path and temp path.
    NSString *tempPath = [AppUtils getDownloadPath:localCity.cityId];
    NSString *destinationPath = [AppUtils getZipFilePath:localCity.cityId];

    // Create dir
    [FileUtil createDir:[AppUtils getDownloadDir]];
    [FileUtil createDir:[AppUtils getZipDir]];

    // Create a request
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url]; 

    // Set temp file and dest file.
    [request setTemporaryFileDownloadPath:tempPath];
    [request setDownloadDestinationPath:destinationPath];
    [request setAllowResumeForFileDownloads:YES];

//    PPDebug(@"Download to %@ (%@)", destinationPath, tempPath);

    //set request delegate
    [request setDelegate:localCity];
    [request setDownloadProgressDelegate:localCity];
    
    return request;
}

- (void)cancel:(City*)city
{
    // Remove temp download file.
    NSString *cityZipPath = [AppUtils getDownloadPath:city.cityId];
    [[NSFileManager defaultManager] removeItemAtPath:cityZipPath error:nil];
    
    // Remove localCity.
    [[LocalCityManager defaultManager] removeLocalCity:city.cityId];
    
    // Cancel and remove request from operation queue.
    for (ASIHTTPRequest *request in [_operationQueue operations]) {
        LocalCity *localCity = [request.userInfo objectForKey:KEY_LOCAL_CITY];
        if(localCity.cityId == city.cityId)
        {
            // Cancels an asynchronous request, clearing all delegates and blocks first
            [request clearDelegatesAndCancel];    
            [request cancel];
            
            // Need to remove request ？？？
                        
            return;
        }
    }
}

- (void)pause:(City*)city
{
    for (ASIHTTPRequest *request in [_operationQueue operations]) {
        LocalCity *localCity = [request.userInfo objectForKey:KEY_LOCAL_CITY];
        if(localCity.cityId == city.cityId)
        {
            //Cancels an asynchronous request, clearing all delegates and blocks first
            [request clearDelegatesAndCancel];    
            [request cancel];
            
            localCity.downloadStatus = DOWNLOAD_PAUSE;
            return;
        }
    }
}

@end
