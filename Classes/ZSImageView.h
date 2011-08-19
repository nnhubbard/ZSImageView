//
//  ZSImageView.h
//
//  Created by Nicholas Hubbard on 8/16/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "JMImageCache.h"

@interface ZSImageView : UIView <JMImageCacheDelegate> {
	NSString *imageUrl;
	UIImage *image;
	UIImage *defaultImage;
	UIImageView *imageView;
	BOOL topLeft;
	BOOL topRight;
	BOOL bottomLeft;
	BOOL bottomRight;
	float cornerRadius;
}

@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *defaultImage;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic) BOOL topLeft;
@property (nonatomic) BOOL topRight;
@property (nonatomic) BOOL bottomLeft;
@property (nonatomic) BOOL bottomRight;
@property (nonatomic) float cornerRadius;


@end
