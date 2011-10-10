//
//  ZSLineView.m
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/24/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "ZSLineView.h"


@implementation ZSLineView

@synthesize borders, corners, borderColor, borderWidth, cornerRadius;


/**
 * Init the frame
 *
 * @version $Revision: 0.1
 */
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    }
    return self;
}//end


/**
 * Drawing
 *
 * @version $Revision: 0.1
 */
- (void)drawRect:(CGRect)rect {
	
	// Stop is we are not using any borders
	if (borders & ZSBorderNone) {
		return;
	}
	
	// Global settings
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	if (!borderWidth) borderWidth = 3.0;
	CGContextSetLineWidth(ctx, borderWidth);
	if (!borderColor) borderColor = [UIColor blackColor];
	CGContextSetStrokeColorWithColor(ctx, borderColor.CGColor);
	
	// All
	if (borders & ZSBorderAll) {
		borders = ZSBorderTop | ZSBorderRight | ZSBorderBottom | ZSBorderLeft;
	}
   
	// Left
	if (borders & ZSBorderLeft) {
		if (((corners & ZSRoundCornerTopLeft) && (corners & ZSRoundCornerBottomLeft)) || corners & ZSRoundCornerAll) {
			CGContextMoveToPoint(ctx, 0, 0);
			//CGContextAddCurveToPoint(ctx, rect.size.height - (cornerRadius/2), rect.size.width - (cornerRadius/2), rect.size.width - (cornerRadius/2), rect.size.height - (cornerRadius/2), 20, 20);
			CGContextAddLineToPoint(ctx, 0,rect.size.height);
			CGContextStrokePath(ctx);
		} else {
			CGContextMoveToPoint(ctx, 0, 0);
			CGContextAddLineToPoint(ctx, 0,rect.size.height);
			CGContextStrokePath(ctx);
		}//end
	}
	
	// Right
	if (borders & ZSBorderRight) {
		CGContextMoveToPoint(ctx, rect.size.width, 0);
		CGContextAddLineToPoint(ctx, rect.size.width,rect.size.height);
		CGContextStrokePath(ctx);
	}
	
	// Top
	if (borders & ZSBorderTop) {
		CGContextMoveToPoint(ctx, 0, 0);
		CGContextAddLineToPoint(ctx, rect.size.width,0);
		CGContextStrokePath(ctx);
	}
	
	// Bottom
	if (borders & ZSBorderBottom) {
		CGContextMoveToPoint(ctx, 0, rect.size.height);
		CGContextAddLineToPoint(ctx, rect.size.width,rect.size.height);
		CGContextStrokePath(ctx);
	}
	
}//end


/**
 * Dealloc
 *
 * @version $Revision: 0.1
 */
- (void)dealloc {
	[borderColor release];
    [super dealloc];
}//end


@end
