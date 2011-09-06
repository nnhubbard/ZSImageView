//
//  Item.h
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/26/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Item : NSObject {
	NSString *title;
	NSString *imageURL;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *imageURL;

@end
