//
//  PlaceListController.m
//  Travel
//
//  Created by  on 12-2-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PlaceListController.h"
#import "Place.pb.h"
#import "PlaceManager.h"
#import "SpotCell.h"
#import "CommonPlaceDetailController.h"

@implementation PlaceListController
@synthesize mapView = _mapView;
@synthesize locationLabel = _locationLabel;
@synthesize mapHolderView = _mapHolderView;
@synthesize superController = _superController;

- (void)dealloc
{
    [_mapView release];
    [_locationLabel release];
    [_mapHolderView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    if (_showMap){
        _mapHolderView.hidden = NO;
        dataTableView.hidden = YES;
    }
    else{
        _mapHolderView.hidden = YES;
        dataTableView.hidden = NO;
    }
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [self setLocationLabel:nil];
    [self setMapHolderView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

+ (PlaceListController*)createController:(NSArray*)list 
                               superView:(UIView*)superView
                         superController:(UIViewController*)superController
{
    PlaceListController* controller = [[[PlaceListController alloc] init] autorelease];
    controller.superController = superController;
    [superView addSubview:controller.view];
    controller.view.frame = superView.bounds;
    [controller setAndReloadPlaceList:list];    
    [controller viewDidLoad];
    return controller;
}

- (void)setAndReloadPlaceList:(NSArray*)list
{
    self.dataList = list;
    [self.dataTableView reloadData];
}

#pragma mark -
#pragma mark TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// return [self getRowHeight:indexPath.row totalRow:[dataList count]];
	// return cellImageHeight;
	
	return 76;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;		// default implementation
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [dataList count];			// default implementation
}


- (Class)getClassByPlace:(Place*)place
{
    if ([place categoryId] == PLACE_TYPE_SPOT){
        return [SpotCell class];
    }
    
    return nil;
}

- (NSString*)getCellIdentifierByClass:(Class)class
{
    return [class getCellIdentifier];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int row = [indexPath row];	
	int count = [dataList count];
	if (row >= count){
		NSLog(@"[WARN] cellForRowAtIndexPath, row(%d) > data list total number(%d)", row, count);
		return nil;
	}
    
    Place* place = [dataList objectAtIndex:row];
    Class placeClass = [self getClassByPlace:place];
    
    NSString *CellIdentifier = [self getCellIdentifierByClass:placeClass];
	UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) { 
		cell = [placeClass createCell:self];
	}
	
    CommonPlaceCell* placeCell = (CommonPlaceCell*)cell;
    
    //[placeCell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"2menu_bg.png"]]];
    UIImageView *view = [[UIImageView alloc] init];
    [view setImage:[UIImage imageNamed:@"li_bg.png"]];
    [placeCell setBackgroundView:view];
    [placeCell setCellDataByPlace:place];
    
	return cell;	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommonPlaceDetailController* controller = [[CommonPlaceDetailController alloc] init];
    [self.superController.navigationController pushViewController:controller animated:YES];
    [controller release];
}


@end
