//
//  TableViewStandard.m
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/26/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "TableViewStandard.h"
#import "ZSImageView.h"


@implementation TableViewStandard

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
	item.imageURL = @"http://farm7.static.flickr.com/6182/6119000509_3bc64baf50_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 2";
	item.imageURL = @"http://farm7.static.flickr.com/6079/6119545410_af37e6f245_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 3";
	item.imageURL = @"http://farm7.static.flickr.com/6185/6119000477_41b38d8dc6_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 4";
	item.imageURL = @"http://farm7.static.flickr.com/6088/6119545376_a964b36b9a_m.jpg";
	[tempItems addObject:item];
	
	item = [[Item alloc] init];
	item.title = @"Image 5";
	item.imageURL = @"http://farm7.static.flickr.com/6206/6119545362_6eb8e55928_m.jpg";
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.indentationLevel = 1;
		cell.indentationWidth = 60;
		
		// Image
		imageView = [[[ZSImageView alloc] initWithFrame:CGRectMake(0, 0, 59, 59)] autorelease];
		imageView.defaultImage = [UIImage imageNamed:@"no-image.png"];
		imageView.imageUrl = item.imageURL;
		imageView.contentMode = UIViewContentModeScaleAspectFill;
		imageView.clipsToBounds = YES;
		imageView.tag = 221;
		imageView.cornerRadius = 10;
		[cell addSubview:imageView];
		
	} else {
		imageView = (ZSImageView *)[cell viewWithTag:221];
		if (imageView) {
			imageView.imageUrl = item.imageURL;
		}//end
	}//end

    
    // Configure the cell...
	cell.textLabel.text = item.title;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
}


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

