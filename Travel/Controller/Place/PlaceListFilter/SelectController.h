//
//  SelectController.h
//  Travel
//
//  Created by 小涛 王 on 12-3-13.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import "PPTableViewController.h"

@protocol SelectControllerDelegate <NSObject>

- (void)didSelectFinish:(NSArray*)selectedList;

@end

@interface SelectController : PPTableViewController
{
    NSMutableArray* _selectedList;
    BOOL _multiOptions;
}

@property (assign, nonatomic) BOOL multiOptions;
@property (retain, nonatomic) NSMutableArray *selectedList;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) id<SelectControllerDelegate> delegate;

+ (SelectController*)createController:(NSArray*)list selectedList:(NSMutableArray*)selectedList multiOptions:(BOOL)multiOptions;
@end
