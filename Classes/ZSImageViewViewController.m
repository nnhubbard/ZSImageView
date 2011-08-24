//
//  ZSImageViewViewController.m
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/16/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "ZSImageViewViewController.h"
#import "ZSImageView.h"

@implementation ZSImageViewViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
	[super viewDidLoad];
	
	// Create the image view
	ZSImageView *imageView = [[[ZSImageView alloc] initWithFrame:CGRectMake(25, 25, 200.0f, 200.0f)] autorelease];
	imageView.imageUrl = @"http://www.indiaonrent.com/forwards/b/beautiful-mountains/res/593qen.jpg";
	imageView.defaultImage = [UIImage imageNamed:@"no-image.png"];
	imageView.contentMode = UIViewContentModeScaleAspectFill;
	imageView.corners = ZSRoundCornerTopLeft | ZSRoundCornerBottomLeft | ZSRoundCornerTopRight;
	imageView.clipsToBounds = YES;
	imageView.cornerRadius = 15;
	[self.view addSubview:imageView];
	
	
	// Create the image view
	ZSImageView *imageView2 = [[[ZSImageView alloc] initWithFrame:CGRectMake(25, 300, 100.0f, 100.0f)] autorelease];
	imageView2.imageUrl = @"http://www.desktopwallpaperhd.com/wallpapers/3/4501.jpg";
	imageView2.defaultImage = [UIImage imageNamed:@"no-image.png"];
	imageView2.corners = ZSRoundCornerAll;
	imageView2.cornerRadius = 10;
	[self.view addSubview:imageView2];
	
	// Create the image view
	ZSImageView *imageView3 = [[[ZSImageView alloc] initWithFrame:CGRectMake(140, 300, 100.0f, 100.0f)] autorelease];
	imageView3.imageUrl = @"http://www.taramtamtam.com/wallpapers/Sport/M/Mountain_biking/images/Mountain_biking_3.jpg";
	imageView3.defaultImage = [UIImage imageNamed:@"no-image.png"];
	imageView3.contentMode = UIViewContentModeScaleAspectFill;
	imageView3.borders = ZSBorderRight | ZSBorderLeft | ZSBorderTop;
	imageView3.borderWidth = 3.0;
	imageView3.borderColor = [UIColor redColor];
	imageView3.clipsToBounds = YES;
	[self.view addSubview:imageView3];
	
}//end


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
