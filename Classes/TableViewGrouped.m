//
//  TableViewStandard.m
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/26/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "TableViewGrouped.h"
#import "ZSImageView.h"


@implementation TableViewGrouped

@synthesize items;


#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	self.tableView.rowHeight = 60;
    Item *item = nil;
	NSMutableArray *tempItems = [[[NSMutableArray alloc] init] autorelease];
	
	// Create
	item = [[Item alloc] init];
	item.title = @"Image 1";
	item.imageURL = @"http://farm7.static.flickr.com/6077/6121848007_ee8659cb83_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 2";
	item.imageURL = @"http://farm7.static.flickr.com/6090/6121848009_fa6888ac52_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 3";
	item.imageURL = @"http://farm7.static.flickr.com/6081/6122391672_2f5ee14674_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 4";
	item.imageURL = @"http://farm7.static.flickr.com/6184/6122391688_93cc14e993_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 5";
	item.imageURL = @"http://farm7.static.flickr.com/6185/6122391696_d1aa96b292_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 6";
	item.imageURL = @"http://farm7.static.flickr.com/6183/6121847971_b8c879081c_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 7";
	item.imageURL = @"http://farm7.static.flickr.com/6075/6121847985_c7061a3613_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 8";
	item.imageURL = @"http://farm7.static.flickr.com/6183/6121847997_368ddea3ac_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 9";
	item.imageURL = @"http://farm7.static.flickr.com/6061/6122391660_51ebf2399c_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 10";
	item.imageURL = @"http://farm7.static.flickr.com/6065/6122391668_7f50744f40_m.jpg";
	[tempItems addObject:item];
	
	self.items = [NSArray arrayWithArray:tempItems];
	
}//end


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [items count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    ZSImageView *imageView = nil;
	Item *item = [items objectAtIndex:indexPath.row];
	
	// What kind of cell are we using?
	int count = [items count];
	NSString *type = nil;
	if (indexPath.row == 0 && count > 1) {
		type = @"ZSFirst";
	} else if (indexPath.row == count-1 && count > 1) {
		type = @"ZSLast";
	} else if (indexPath.row == 0 && count == 1) {
		type = @"ZSSingle";
	} else {
		type = @"ZSDefault";
	}//end
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.indentationLevel = 1;
		cell.indentationWidth = 60;
		
		// Image
		imageView = [[[ZSImageView alloc] initWithFrame:CGRectMake(10, 0, 59, 59)] autorelease];
		imageView.defaultImage = [UIImage imageNamed:@"no-image.png"];
		imageView.imageUrl = item.imageURL;
		imageView.contentMode = UIViewContentModeScaleAspectFill;
		imageView.clipsToBounds = YES;
		imageView.tag = 221;
		imageView.cornerRadius = 10;
		imageView.borderWidth = 2.0;
		imageView.borderColor = RGB(202, 202, 202);
		imageView.borders = ZSBorderRight;
		[cell addSubview:imageView];
		
    } else {
		imageView = (ZSImageView *)[cell viewWithTag:221];
		if (imageView) {
			imageView.imageUrl = item.imageURL;
		}//end
	}//end
	
	// Set the corners
	if ([type isEqualToString:@"ZSFirst"]) {
		imageView.frame = CGRectMake(10, 1, 59, 59);
		imageView.corners = ZSRoundCornerTopLeft;
	} else if ([type isEqualToString:@"ZSLast"]) {
		imageView.corners = ZSRoundCornerBottomLeft;
	} else if ([type isEqualToString:@"ZSSingle"]) {
		imageView.corners = ZSRoundCornerTopLeft | ZSRoundCornerBottomLeft;
	} else {
		imageView.corners = ZSRoundCornerNone;
	}//end
	
	cell.textLabel.text = item.title;
    
    return cell;
}


/**
 * Sets the title for section headers
 *
 * @version $Revision: 0.1
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	
	if (section == 0) {
		return @"This demo shows how you can round the corner of the first and last rows as well as use a border on one side.";
	}
	
	return nil;
	
}//end


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[items release];
    [super dealloc];
}


@end

