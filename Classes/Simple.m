//
//  Simple.m
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/26/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "Simple.h"
#import "ZSImageView.h"

@implementation Simple

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor darkGrayColor];
	
	ZSImageView *imageView = [[[ZSImageView alloc] initWithFrame:CGRectMake(20, 20, 160, 160)] autorelease];
	imageView.defaultImage = [UIImage imageNamed:@"no-image.png"];
	imageView.imageUrl = @"http://farm7.static.flickr.com/6206/6119008561_5f5723fc54_m.jpg";
	imageView.contentMode = UIViewContentModeScaleAspectFill;
	imageView.clipsToBounds = YES;
	[self.view addSubview:imageView];
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
