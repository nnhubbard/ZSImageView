//
//  ZSImageView.h
//
//  Created by Nicholas Hubbard on 8/16/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ZSLineView.h"
#import "JMImageCache.h"

@interface ZSImageView : UIView <JMImageCacheDelegate> {
	NSString *imageUrl;
	UIImage *image;
	UIImage *defaultImage;
	UIImage *downloadedImage;
	UIImageView *imageView;
	UIColor *borderColor;
	Corners corners;
	Borders borders;
	float cornerRadius;
	CGFloat borderWidth;
	int count;
}

@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *defaultImage;
@property (nonatomic, retain) UIImage *downloadedImage;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic) Corners corners;
@property (nonatomic) Borders borders;
@property (nonatomic) float cornerRadius;
@property (nonatomic) CGFloat borderWidth;


@end
