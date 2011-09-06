//
//  Item.m
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/26/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "Item.h"


@implementation Item

@synthesize title, imageURL;

- (void)dealloc {
	[title release];
	[imageURL release];
    [super dealloc];
}

@end
