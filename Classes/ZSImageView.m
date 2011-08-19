//
//  ZSImageView.m
//
//  Created by Nicholas Hubbard on 8/16/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "ZSImageView.h"


@implementation ZSImageView

@synthesize imageUrl, defaultImage, topLeft, topRight, bottomLeft, bottomRight, image, cornerRadius, imageView;

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
    
	// Can we continue?
	if (!imageUrl && !defaultImage) {
		return;
	}
	
	// Draw ImageView
	UIImageView *tmp = [[UIImageView alloc] initWithFrame:rect];
	
	// Make sure we have a remote url
	if (imageUrl && [imageUrl length] > 0) {
		
		// Set the image view
		UIImage *temp = [[JMImageCache sharedCache] imageForURL:imageUrl delegate:self];
		
		// See if we recieved an image yet, if not use default
		if (temp) {
			tmp.image = temp;
		} else {
			
			if (defaultImage) {
				tmp.image = defaultImage;
			} else {
				tmp.image = nil;
			}//end

		}//end
		
	} else {
		tmp.image = defaultImage;
	}//end
	
	tmp.contentMode = self.contentMode;
	self.imageView = tmp;
	[tmp release];
	[self addSubview:imageView];
	
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
	
	// Make sure we even have corners to change
	if (corners != 0) {
		// Create the mask
		UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
		CAShapeLayer *maskLayer = [CAShapeLayer layer];
		maskLayer.frame = self.bounds;
		maskLayer.path = maskPath.CGPath;
		self.layer.mask = maskLayer;
	} else {
		self.layer.mask = nil;
	}//end
	
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
		self.imageView.image = img;
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
	[imageView release];
    [super dealloc];
}//end

@end
