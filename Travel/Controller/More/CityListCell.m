//
//  DownloadListCell.m
//  Travel
//
//  Created by 小涛 王 on 12-3-7.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import "CityListCell.h"
#import "AppUtils.h"
#import "PPDebug.h"
#import "ImageName.h"
#import "LocalCityManager.h"
#import "LocaleUtils.h"
#import "Reachability.h"

#define NO_DOWNLOAD 0
#define DOWNLOAD 1
#define FINISH_DOWNLOAD 2

@implementation CityListCell

@synthesize city = _city;
@synthesize cityListCellDelegate = _cityListCellDelegate;
@synthesize selectCurrentCityBtn;
@synthesize dataSizeLabel;
@synthesize downloadProgressView;
@synthesize downloadPersentLabel;
@synthesize pauseDownloadBtn;
@synthesize downloadButton;
@synthesize onlineButton;
@synthesize cancelDownloadBtn;
@synthesize cityNameLabel;
@synthesize downloadDoneLabel;
@synthesize moreDetailBtn;

#pragma mark -
#pragma mark: 
- (void)dealloc {
    [_city release];
    [_cityListCellDelegate release];
    [downloadProgressView release];
    [downloadPersentLabel release];
    [downloadButton release];
    [onlineButton release];
    [cityNameLabel release];
    [dataSizeLabel release];
    [downloadPersentLabel release];
    [downloadDoneLabel release];
    [pauseDownloadBtn release];
    [cancelDownloadBtn release];
    [moreDetailBtn release];
    [selectCurrentCityBtn release];
    [super dealloc];
}

#pragma mark -
#pragma mark: implementation of PPTableViewCellProtocol
+ (NSString*)getCellIdentifier
{
    return @"CityListCell";
}

+ (CGFloat)getCellHeight
{
    return 44.0f;
}


#pragma mark -
#pragma mark: Customize the appearance of cell.
- (void)setCellData:(City*)city
{
    self.city = city;    
    self.selectCurrentCityBtn.selected = ([[AppManager defaultManager] getCurrentCityId] == _city.cityId); 
//    PPDebug(@"current city id: %d", [[AppManager defaultManager] getCurrentCityId]);
//    PPDebug(@"city id: %d", _city.cityId);

    

    self.cityNameLabel.text = [NSString stringWithFormat:NSLS(@"%@.%@"), _city.countryName, _city.cityName];
    self.cityNameLabel.textColor = ([[AppManager defaultManager] getCurrentCityId] == _city.cityId)?[UIColor redColor]:[UIColor darkGrayColor];

    self.dataSizeLabel.text = [self getCityDataSizeString];
    self.downloadDoneLabel.textColor = [UIColor darkGrayColor];
    
    [self setCellAppearance];
    return;
}

- (NSString*)getCityDataSizeString
{
    return [NSString stringWithFormat:@"%0.2fM", _city.dataSize/1024.0/1024.0];
}

- (void)setCellAppearance
{ 
    LocalCity *localCity = [[LocalCityManager defaultManager] getLocalCity:_city.cityId];

    if(localCity == nil)
    {
        [self setCellAppearance:NO_DOWNLOAD localCity:localCity];
        return;
    }
    
    if (localCity.downloadDoneFlag == NO) {
        [self setCellAppearance:DOWNLOAD localCity:localCity];
    }
    else {
        [self setCellAppearance:FINISH_DOWNLOAD localCity:localCity];
    }
}

- (void)setCellAppearance:(int)downloadStatus localCity:(LocalCity*)localCity
{
    switch (downloadStatus) {
        case NO_DOWNLOAD:  
            self.dataSizeLabel.hidden = NO;
            self.downloadProgressView.hidden = YES;
            self.downloadPersentLabel.hidden = YES;
            self.pauseDownloadBtn.hidden = YES;
            
            self.downloadButton.hidden = NO;
            self.cancelDownloadBtn.hidden = YES;
            self.onlineButton.hidden = NO;
            
            self.downloadDoneLabel.hidden = YES;
//            [downloadDoneLabel setTextColor:[UIColor darkGrayColor]];
            self.moreDetailBtn.hidden = YES;
            break;
            
        case DOWNLOAD:
            self.dataSizeLabel.hidden = YES;
            self.downloadProgressView.hidden = NO;
            self.downloadPersentLabel.hidden = NO;
            self.pauseDownloadBtn.hidden = NO;
            
            self.downloadButton.hidden = YES;
            self.cancelDownloadBtn.hidden = NO;
            self.onlineButton.hidden = NO;
            
            self.downloadDoneLabel.hidden = YES;
            self.moreDetailBtn.hidden = YES;
            
            self.pauseDownloadBtn.selected = !localCity.downloadingFlag;
            self.downloadProgressView.progress = localCity.downloadProgress;
            float persent = localCity.downloadProgress*100;
            self.downloadPersentLabel.text = [NSString stringWithFormat:@"%2.f%%", persent];
            
            break;
            
        case FINISH_DOWNLOAD:
            self.dataSizeLabel.hidden = NO;
            self.downloadProgressView.hidden = YES;
            self.downloadPersentLabel.hidden = YES;
            self.pauseDownloadBtn.hidden = YES;
            
            self.downloadButton.hidden = YES;
            self.cancelDownloadBtn.hidden = YES;
            self.onlineButton.hidden = YES;
            
            self.downloadDoneLabel.hidden = NO;
            self.moreDetailBtn.hidden = NO;
            
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark: Imlementation for buttons event.
- (IBAction)clickDownload:(id)sender {
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == ReachableViaWWAN){
        // user is using Mobile Network
        NSString *message = NSLS(@"您现在使用非WIFI网络下载，将会占用大量流量，是否继续下载?");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLS(@"提示") message:NSLS(message) delegate:self cancelButtonTitle:NSLS(@"取消") otherButtonTitles:@"确定",nil];
        [alert show];
        [alert release];
    }
    else {
        // Download city data.
        [[AppService defaultService] downloadCity:_city];
        
        // Call delegate method to do some addition work.
        if (_cityListCellDelegate && [_cityListCellDelegate respondsToSelector:@selector(didStartDownload:)]) {
            [_cityListCellDelegate didStartDownload:_city];
        } 
        else {
            PPDebug(@"[_cityListCellDelegate respondsToSelector:@selector(didStartDownload:)]");
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        // Download city data.
        [[AppService defaultService] downloadCity:_city];
        
        // Call delegate method to do some addition work.
        if (_cityListCellDelegate && [_cityListCellDelegate respondsToSelector:@selector(didStartDownload:)]) {
            [_cityListCellDelegate didStartDownload:_city];
        } 
        else {
            PPDebug(@"[_cityListCellDelegate respondsToSelector:@selector(didStartDownload:)]");
        }
    }
}

- (IBAction)clickPauseBtn:(id)sender {
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    if (button.selected) {
        //TODO, pause download request
        [[AppService defaultService] pauseDownloadCity:_city];
    }
    else {
        //TODO, resume download request
        if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == ReachableViaWWAN){
            // user is using Mobile Network
            NSString *message = NSLS(@"您现在使用非WIFI网络下载，将会占用大量流量，是否继续下载?");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLS(@"提示") message:NSLS(message) delegate:self cancelButtonTitle:NSLS(@"取消") otherButtonTitles:@"确定",nil];
            [alert show];
            [alert release];
        }
        else {
            // Download city data.
            [[AppService defaultService] downloadCity:_city];
            
            // Call delegate method to do some addition work.
            if (_cityListCellDelegate && [_cityListCellDelegate respondsToSelector:@selector(didStartDownload:)]) {
                [_cityListCellDelegate didStartDownload:_city];
            } 
            else {
                PPDebug(@"[_cityListCellDelegate respondsToSelector:@selector(didStartDownload:)]");
            }
        }
    }
}

- (IBAction)clickCancel:(id)sender {
    [[AppService defaultService] cancelDownloadCity:_city];
    self.pauseDownloadBtn.selected = NO;
}


- (IBAction)clickOnlineBtn:(id)sender {
    [self selectCurrentCity];
}

- (IBAction)clickCurrentCityBtn:(id)sender {
    [self selectCurrentCity];
}

- (void)selectCurrentCity
{
    // Set current cityId.
    [[AppManager defaultManager] setCurrentCityId:_city.cityId];
    
    // Call delegate metchod to do some addition work.
    if (_cityListCellDelegate && [_cityListCellDelegate respondsToSelector:@selector(didSelectCurrendCity:)]) {
        [_cityListCellDelegate didSelectCurrendCity:_city];
    }
    else {
        PPDebug(@"[_cityCellDelegate respondsToSelector:@selector(didSelectCurrendCity:)]");
    }
}

@end
