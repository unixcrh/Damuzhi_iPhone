//
//  CityManagementController.h
//  Travel
//
//  Created by 小涛 王 on 12-3-7.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTableViewController.h"
#import "CityListCell.h"
#import "DownloadListCell.h"
#import "AppService.h"


@interface CityManagementController : PPTableViewController <CityListCellDelegate, DownloadListCellDelegate, UnzipDelegate>
{
    UITableView *_downloadTableView;
    NSArray *_downloadList;
}

@property (nonatomic, retain) NSArray *downloadList;
@property (nonatomic, retain) IBOutlet UITableView *downloadTableView;
@property (retain, nonatomic) IBOutlet UILabel *promptLabel;
@property (retain, nonatomic) UIButton *cityListBtn;
@property (retain, nonatomic) UIButton *downloadListBtn;

+ (CityManagementController*)getInstance;

@end
