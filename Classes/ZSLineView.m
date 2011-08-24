//
//  ZSLineView.m
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/24/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "ZSLineView.h"


@implementation ZSLineView

@synthesize borders, borderColor, borderWidth;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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
		CGContextMoveToPoint(ctx, 0, 0);
		CGContextAddLineToPoint(ctx, 0,rect.size.height);
		CGContextStrokePath(ctx);
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


- (void)dealloc {
	[borderColor release];
    [super dealloc];
}


@end
