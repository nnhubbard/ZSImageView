//
//  ZSImageView.h
//
//  Created by Nicholas Hubbard on 8/16/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ZSLineView.h"
#import "JMImageCache.h"

typedef enum {
	ZSRoundCornerTopLeft = 1,
	ZSRoundCornerTopRight = 2,
	ZSRoundCornerBottomLeft = 4,
	ZSRoundCornerBottomRight = 8,
	ZSRoundCornerAll = 16,
	ZSRoundCornerNone = 32
} Corners;

@interface ZSImageView : UIView <JMImageCacheDelegate> {
	NSString *imageUrl;
	UIImage *image;
	UIImage *defaultImage;
	UIImageView *imageView;
	UIColor *borderColor;
	Corners corners;
	Borders borders;
	float cornerRadius;
	CGFloat borderWidth;
}

@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *defaultImage;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic) Corners corners;
@property (nonatomic) Borders borders;
@property (nonatomic) float cornerRadius;
@property (nonatomic) CGFloat borderWidth;


@end
