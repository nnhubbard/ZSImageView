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

@interface ZSLineView : UIView {
	Borders borders;
	UIColor *borderColor;
	CGFloat borderWidth;
}

@property (nonatomic) Borders borders;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic) CGFloat borderWidth;

@end
