//
//  ZSImageView.m
//
//  Created by Nicholas Hubbard on 8/16/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "ZSImageView.h"


@implementation ZSImageView

@synthesize imageUrl, defaultImage, topLeft, topRight, bottomLeft, bottomRight, image, cornerRadius;

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
	
	[self setNeedsDisplay];
	
}//end


#pragma mark -
#pragma mark Drawing

/**
 * Draw the image
 *
 * @version $Revision: 0.1
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	
	// Set the image view
	UIImage *temp = [[JMImageCache sharedCache] imageForURL:imageUrl delegate:self];
	
	// See if we recieved an image yet, if not use default
	if (temp) {
		self.image = temp;
	} else {
		self.image = defaultImage;
	}//end
	
	// Round the edges
	self.image = image;
	
	// Draw the image
	[image drawInRect:rect];
	
	// -- Round the view --
	UIRectCorner corners = 0;
	
	// Top Left
	if (topLeft) {
		corners |= UIRectCornerTopLeft;
	}//end
	
	// Top Right
	if (topRight) {
		corners |= UIRectCornerTopRight;
	}//end
	
	// Bottom Left
	if (bottomLeft) {
		corners |= UIRectCornerBottomLeft;
	}
	
	// Bottom Right
	if (bottomRight) {
		corners |= UIRectCornerBottomRight;
	}
	
	// Corner Radius Default
	if (!cornerRadius) {
		self.cornerRadius = 10;
	}
	
	// Create the mask
	UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
	CAShapeLayer *maskLayer = [CAShapeLayer layer];
	maskLayer.frame = self.bounds;
	maskLayer.path = maskPath.CGPath;
	self.layer.mask = maskLayer;
	
}//end


#pragma mark -
#pragma mark JMImageCacheDelegate

/**
 * Delegate method that gets called when an image is done downloading
 *
 * @version $Revision: 0.1
 */
- (void)cache:(JMImageCache *)cache didDownloadImage:(UIImage *)img forURL:(NSString *)url {
	if ([url isEqualToString:imageUrl]) {
		
		self.image = image;
		[self setNeedsDisplay];
	}
	
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
    [super dealloc];
}//end

@end
