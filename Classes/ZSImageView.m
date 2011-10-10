//
//  ZSImageView.m
//
//  Created by Nicholas Hubbard on 8/16/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "ZSImageView.h"


@implementation ZSImageView

@synthesize imageUrl, defaultImage, corners, image, cornerRadius, imageView, borders, borderColor, borderWidth, downloadedImage;

#pragma mark -
#pragma mark Initialization

/**
 * Init the frame
 *
 * @version $Revision: 0.1
 */
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.opaque = YES;
		
    }
    return self;
}//end


/**
 * Set imageUrl
 *
 * @version $Revision: 0.1
 */
- (void)setImageUrl:(NSString *)url {
	[imageUrl release];
	imageUrl = [url retain];
	if (imageView) {
		[self performSelector:@selector(updateImageForUrl:) withObject:url];
	}
}//end


/**
 * Update image and view
 *
 * @version $Revision: 0.1
 */
- (void)updateImageForUrl:(NSString *)url {
	
	// Can we continue?
	if (!imageUrl && !defaultImage) {
		return;
	}
	
	// Size
	CGRect size = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	
	// Our image
	UIImage *temp = [[JMImageCache sharedCache] imageForURL:imageUrl delegate:self];
	
	// Make sure we have a remote url
	if (imageUrl && [imageUrl length] > 0) {
		
		// See if we recieved an image yet, if not use default
		if (temp) {
			self.imageView.image = temp;
		} else {
			
			// Use default image?
			if (defaultImage) {
				
				self.imageView.image = defaultImage;
			} else {
				self.imageView.image = nil;
			}//end
			
		}//end
		
	} else {
		self.imageView.image = defaultImage;
	}//end
	
	// Set the content mode and image
	self.imageView.contentMode = self.contentMode;
	
	// If we already have an image view we still need to set the image
	if (imageView) {
		
		if (temp) {
			self.imageView.image = temp;
		} else {
			self.imageView.image = defaultImage;
		}
		
	}//end
	
	// Borders
	if (borders) {
		ZSLineView *line = [[ZSLineView alloc] initWithFrame:size];
		line.borders = borders;
		line.corners = corners;
		line.cornerRadius = cornerRadius;
		line.borderColor = borderColor;
		line.borderWidth = borderWidth;
		[self addSubview:line];
		[line release];
	}//end
	
	// -- Round the view --
	UIRectCorner cornersAdd = 0;
	
	// Top Left
	if (corners & ZSRoundCornerTopLeft) {
		cornersAdd |= UIRectCornerTopLeft;
	}//end
	
	// Top Right
	if (corners & ZSRoundCornerTopRight) {
		cornersAdd |= UIRectCornerTopRight;
	}//end
	
	// Bottom Left
	if (corners & ZSRoundCornerBottomLeft) {
		cornersAdd |= UIRectCornerBottomLeft;
	}
	
	// Bottom Right
	if (corners & ZSRoundCornerBottomRight) {
		cornersAdd |= UIRectCornerBottomRight;
	}
	
	// All Corners
	if (corners & ZSRoundCornerAll) {
		cornersAdd = UIRectCornerAllCorners;
	}
	
	// Reset corners?
	if (corners & ZSRoundCornerNone) {
		cornersAdd = 0;
	}
	
	// Corner Radius Default
	if (!cornerRadius) {
		self.cornerRadius = 10;
	}
	
	// Make sure we even have corners to change
	if (cornersAdd != 0) {
		// Create the mask
		UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:cornersAdd cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
		CAShapeLayer *maskLayer = [CAShapeLayer layer];
		maskLayer.frame = self.bounds;
		maskLayer.path = maskPath.CGPath;
		self.layer.mask = maskLayer;
	} else {
		self.layer.mask = nil;
	}//end
	
}


/**
 * Layout our subviews
 *
 * @version $Revision: 0.1
 */
- (void)layoutSubviews {
	
	// Size
	CGRect size = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	
	// Draw ImageView
	if (!imageView) {
		UIImageView *tmp = [[[UIImageView alloc] initWithFrame:size] autorelease];
		self.imageView = tmp;
		[self addSubview:imageView];
	}
	
	// Update images
	[self performSelector:@selector(updateImageForUrl:) withObject:imageUrl];
	
}//end


#pragma mark -
#pragma mark JMImageCacheDelegate

/**
 * Delegate method that gets called when an image is done downloading
 *
 * @version $Revision: 0.1
 */
- (void)cache:(JMImageCache *)cache didDownloadImage:(UIImage *)img forURL:(NSString *)url {
	
	// Make sure we are using the correct image
	if ([url isEqualToString:imageUrl]) {
		self.imageView.image = img;
		self.downloadedImage = img;
		
		// This generally means that we have no connection
		// Use default image
		if (!img || !url) {
			self.imageView.image = defaultImage;
		}
		
	}//end
	
}//end


#pragma mark -
#pragma mark Memory

/**
 * Dealloc
 *
 * @version $Revision: 0.1
 */
- (void)dealloc {
	[imageUrl release];
	[defaultImage release];
	[image release];
	[imageView release];
	[borderColor release];
	[downloadedImage release];
    [super dealloc];
}//end

@end
