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


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
	[super viewDidLoad];
	
	// Create the image view
	ZSImageView *imageView = [[[ZSImageView alloc] initWithFrame:CGRectMake(100, 100, 200.0f, 500.0f)] autorelease];
	imageView.imageUrl = @"http://farm7.static.flickr.com/6067/6059587693_9c39728932_b.jpg";
	imageView.defaultImage = [UIImage imageNamed:@"no-image.png"];
	imageView.contentMode = UIViewContentModeScaleAspectFill;
	imageView.topLeft = YES;
	imageView.bottomLeft = YES;
	imageView.cornerRadius = 15;
	[self.view addSubview:imageView];
	
	// Create the image view
	ZSImageView *imageView2 = [[[ZSImageView alloc] initWithFrame:CGRectMake(600, 400, 100.0f, 100.0f)] autorelease];
	imageView2.imageUrl = @"http://farm7.static.flickr.com/6070/6059589377_48cce910c6_b.jpg";
	imageView2.defaultImage = [UIImage imageNamed:@"no-image.png"];
	imageView2.topLeft = YES;
	imageView2.topRight = YES;
	imageView2.bottomLeft = YES;
	imageView2.bottomRight = YES;
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
