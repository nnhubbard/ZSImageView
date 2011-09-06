//
//  ZSLineView.h
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/24/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	ZSBorderTop = 1,
	ZSBorderRight = 2,
	ZSBorderBottom = 4,
	ZSBorderLeft = 8,
	ZSBorderAll = 16,
	ZSBorderNone = 32
} Borders;

typedef enum {
	ZSRoundCornerTopLeft = 1,
	ZSRoundCornerTopRight = 2,
	ZSRoundCornerBottomLeft = 4,
	ZSRoundCornerBottomRight = 8,
	ZSRoundCornerAll = 16,
	ZSRoundCornerNone = 32
} Corners;

@interface ZSLineView : UIView {
	Borders borders;
	Corners corners;
	UIColor *borderColor;
	CGFloat borderWidth;
	float cornerRadius;
}

@property (nonatomic) Borders borders;
@property (nonatomic) Corners corners;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) float cornerRadius;

@end
