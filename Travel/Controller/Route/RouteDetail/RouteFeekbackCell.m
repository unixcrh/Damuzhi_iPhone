//
//  RouteFeekbackCell.m
//  Travel
//
//  Created by 小涛 王 on 12-6-20.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import "RouteFeekbackCell.h"
#import "TimeUtils.h"
#import "PPDebug.h"

@interface RouteFeekbackCell ()

@end

@implementation RouteFeekbackCell
@synthesize userNameLabel;
@synthesize dateLabel;
@synthesize contentLabel;
@synthesize bgImageView;

+ (CGFloat)getCellHeight
{
    return 98;
}




+ (NSString *)getCellIdentifier
{
    return @"RouteFeekbackCell";
}

- (void)setCellData:(RouteFeekback *)routeFeekback
{

    userNameLabel.text = routeFeekback.nickName;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:routeFeekback.date];
    dateLabel.text = dateToStringByFormat(date, DATE_FORMAT);
    contentLabel.text = routeFeekback.content;
    
    CGSize withinSize = CGSizeMake(contentLabel.frame.size.width, MAXFLOAT);
    CGSize size = [routeFeekback.content sizeWithFont:contentLabel.font constrainedToSize:withinSize lineBreakMode:contentLabel.lineBreakMode];
    
    contentLabel.frame = CGRectMake(contentLabel.frame.origin.x, contentLabel.frame.origin.y, contentLabel.frame.size.width, size.height);
    
    //PPDebug(@"%@", routeFeekback);
}

- (void)dealloc {
    [userNameLabel release];
    [dateLabel release];
    [contentLabel release];
    [bgImageView release];
    [super dealloc];
}

@end
