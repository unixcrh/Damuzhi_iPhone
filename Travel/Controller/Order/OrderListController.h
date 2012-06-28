//
//  OrderListController.h
//  Travel
//
//  Created by 小涛 王 on 12-6-26.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import "PPTableViewController.h"
#import "OrderService.h"
#import "OrderCell.h"

@interface OrderListController : PPTableViewController <OrderServiceDelegate, OrderCellDelegate>

- (id)initWithOrderType:(int)orderType;


@end
