    //
//  Rounded.m
//  ZSImageView
//
//  Created by Nicholas Hubbard on 9/4/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "Border.h"
#import "ZSImageView.h"


@implementation Border

- (void)viewDidLoad {
    [super viewDidLoad];
	
	ZSImageView *imageView = [[[ZSImageView alloc] initWithFrame:CGRectMake(20, 20, 160, 160)] autorelease];
	imageView.defaultImage = [UIImage imageNamed:@"no-image.png"];
	imageView.imageUrl = @"http://farm7.static.flickr.com/6208/6119008541_d517e1eecd_m.jpg";
	imageView.contentMode = UIViewContentModeScaleAspectFill;
	imageView.borders = ZSBorderTop | ZSBorderRight | ZSBorderLeft;
	imageView.borderColor = [UIColor blueColor];
	imageView.borderWidth = 4.0;
	imageView.clipsToBounds = YES;
	[self.view addSubview:imageView];
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
