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
	imageView.cornerRadius = 15;
	[self.view addSubview:imageView];
	
	// Create the image view
	ZSImageView *imageView2 = [[[ZSImageView alloc] initWithFrame:CGRectMake(100, 300, 100.0f, 100.0f)] autorelease];
	imageView2.imageUrl = @"http://www.desktopwallpaperhd.com/wallpapers/3/4501.jpg";
	imageView2.defaultImage = [UIImage imageNamed:@"no-image.png"];
	imageView2.corners = ZSRoundCornerAll;
	imageView2.cornerRadius = 10;
	[self.view addSubview:imageView2];
	
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
