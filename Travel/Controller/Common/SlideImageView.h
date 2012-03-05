//
//  SlideImageView.h
//  Travel
//
//  Created by  on 12-2-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideImageView : UIView
{
    BOOL currentPage;
    float currentPosition;
}

@property (nonatomic, retain)IBOutlet UIScrollView *scrollView;

//-(IBAction)changePage;

- (id)initWithFrame:(CGRect)frame;

- (void)setImages:(NSArray*)images;

@end