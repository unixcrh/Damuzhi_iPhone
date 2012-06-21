//
//  UserService.m
//  Travel
//
//  Created by  on 12-3-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UserService.h"
#import "UserManager.h"
#import "TravelNetworkRequest.h"
#import "JSON.h"
#import "LogUtil.h"

@implementation UserService

static UserService* _defaultUserService = nil;

+ (UserService*)defaultService
{
    if (_defaultUserService == nil) {
        _defaultUserService = [[UserService alloc] init];
    }
    return _defaultUserService;
}

- (void)autoRegisterUser:(NSString*)deviceToken
{
    // if user exists locally then return, else send a registration to server
    if ([[UserManager defaultManager] getUserId]) {
        return;
    }
    else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            CommonNetworkOutput *output = [TravelNetworkRequest registerUser:1 token:deviceToken];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (output.textData != nil) {
                    NSDictionary* jsonDict = [output.textData JSONValue];
                    NSNumber *result = (NSNumber*)[jsonDict objectForKey:PARA_TRAVEL_RESULT];
                    
                    if (0 == result.intValue){
                        NSString *userId = (NSString*)[jsonDict objectForKey:PARA_TRAVEL_USER_ID];
                        [[UserManager defaultManager] saveUserId:userId];
                    }else {
                        PPDebug(@"<UserService> autoRegisterUser faild,result:%d", result.intValue);
                    }
                }else {
                    PPDebug(@"<UserService>autoRegisterUser:　Get User ID faild");
                }
            });                        
        });
    }
}


- (void)queryVersion:(id<UserServiceDelegate>)delegate;
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CommonNetworkOutput *output = [TravelNetworkRequest queryVersion];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (output.resultCode == ERROR_SUCCESS) {
                NSDictionary* jsonDict = [output.textData JSONValue];
                NSString *app_version = (NSString*)[jsonDict objectForKey:PARA_TRAVEL_APP_VERSION];
                NSString *app_data_version = (NSString*)[jsonDict objectForKey:PARA_TRAVEL_APP_DATA_VERSION];
                
                if (delegate && [delegate respondsToSelector:@selector(queryVersionFinish:dataVersion:)]) {
                    [delegate queryVersionFinish:app_version dataVersion:app_data_version];
                }
            }
        });                        
    });

}

- (void)submitFeekback:(id<UserServiceDelegate>)delegate feekback:(NSString*)feekback contact:(NSString*)contact
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CommonNetworkOutput *output = [TravelNetworkRequest submitFeekback:feekback contact:contact];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (delegate && [delegate respondsToSelector:@selector(submitFeekbackDidFinish:)]) {
                 [delegate submitFeekbackDidFinish:(!output.resultCode)];
            }
        });                        
    });
}


- (void)loginWithLoginId:(NSString *)loginId password:(NSString *)password os:(int)os
{
    
}

- (void)signUpWithLoginId:(NSString *)loginId password:(NSString *)password delegate:(id<UserServiceDelegate>)delegate
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CommonNetworkOutput *output = [TravelNetworkRequest signUp:loginId password:password];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (delegate && [delegate respondsToSelector:@selector(signUpDidFinish:)]) {
                [delegate signUpDidFinish:(!output.resultCode)];
            }
        });                        
    });
}

- (void)verificate:(NSString *)loginId telephone:(NSString *)telephone
{}
- (void)verificate:(NSString *)loginId code:(NSString *)code
{}

- (void)retrievePassword:(NSString *)telephone
{}

- (void)modifyUserInfoWithLoginId:(NSString *)loginId
                            token:(NSString *)token 
                         fullName:(NSString *)fullName
                         nickName:(NSString *)nickName
                           gender:(int)gender
                        telephone:(NSString *)telephone
                            email:(NSString *)email
                          address:(NSString *)address
{}

- (void)modifyPasswordWithLoginId:(NSString *)loginId
                            token:(NSString *)token 
                      oldPassword:(NSString *)oldPassword
                      newPassword:(NSString *)newPassword
{}

- (void)retrieveUserInfoLoginId:(NSString *)loginId
                          token:(NSString *)token
{}

@end
