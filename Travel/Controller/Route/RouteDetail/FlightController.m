//
//  FlightController.m
//  Travel
//
//  Created by 小涛 王 on 12-7-3.
//  Copyright (c) 2012年 甘橙软件. All rights reserved.
//

#import "FlightController.h"

//@interface FlightController ()
//
//@end

@implementation FlightController
@synthesize departFlightTextField;
@synthesize departFlightLaunchInfoTextField;
@synthesize departFlightDescendInfoTextField;
@synthesize departFlightNumberTextField;
@synthesize returnFlightTextField;
@synthesize returnFlightLaunchInfoTextField;
@synthesize returnFlightDescendInfoTextField;
@synthesize returnFlightNumberTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationLeftButton:NSLS(@" 返回") 
                        imageName:@"back.png"
                           action:@selector(clickBack:)];
    
    self.navigationItem.title = NSLS(@"机票详情");
}

- (void)viewDidUnload
{
    [self setDepartFlightTextField:nil];
    [self setDepartFlightLaunchInfoTextField:nil];
    [self setDepartFlightDescendInfoTextField:nil];
    [self setDepartFlightNumberTextField:nil];
    [self setReturnFlightTextField:nil];
    [self setReturnFlightLaunchInfoTextField:nil];
    [self setReturnFlightDescendInfoTextField:nil];
    [self setReturnFlightNumberTextField:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [departFlightTextField release];
    [departFlightLaunchInfoTextField release];
    [departFlightDescendInfoTextField release];
    [departFlightNumberTextField release];
    [returnFlightTextField release];
    [returnFlightLaunchInfoTextField release];
    [returnFlightDescendInfoTextField release];
    [returnFlightNumberTextField release];
    [super dealloc];
}
@end