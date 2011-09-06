//
//  TableViewStandard.h
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/26/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"


@interface TableViewStandard : UITableViewController {
	NSArray *items;
}

@property (nonatomic, retain) NSArray *items;

@end
