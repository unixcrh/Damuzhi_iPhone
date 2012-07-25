//
//  NonMemberOrderController.h
//  Travel
//
//  Created by 小涛 王 on 12-6-26.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import "PPViewController.h"
#import "TouristRoute.pb.h"

@protocol NonMemberOrderDelegate <NSObject,UIAlertViewDelegate>

- (void)didclickSubmit:(NSString *)contactPerson telephone:(NSString *)telephone;

@end


@interface NonMemberOrderController : PPViewController <UITextFieldDelegate,UIAlertViewDelegate>

@property (retain, nonatomic) IBOutlet UILabel *routeNameLabel;
@property (retain, nonatomic) IBOutlet UITextField *contactPersonTextField;
@property (retain, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (assign, nonatomic) id<NonMemberOrderDelegate>  delegate;

@property (retain, nonatomic) IBOutlet UIScrollView *backGroundScrollView;

- (id)initWithRoute:(TouristRoute *)route
         departDate:(NSDate *)departDate
              adult:(int)adult
           children:(int)children;

@end
