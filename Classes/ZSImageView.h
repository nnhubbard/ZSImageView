//
//  ZSImageView.h
//
//  Created by Nicholas Hubbard on 8/16/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "JMImageCache.h"

typedef enum {
	ZSRoundCornerTopLeft = 1,
	ZSRoundCornerTopRight = 2,
	ZSRoundCornerBottomLeft = 4,
	ZSRoundCornerBottomRight = 8,
	ZSRoundCornerAll = 16
} Corners;

@interface ZSImageView : UIView <JMImageCacheDelegate> {
	NSString *imageUrl;
	UIImage *image;
	UIImage *defaultImage;
	UIImageView *imageView;
	Corners corners;
	float cornerRadius;
}

@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *defaultImage;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic) Corners corners;
@property (nonatomic) float cornerRadius;


@end
