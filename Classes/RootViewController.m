//
//  RootViewController.m
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/24/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import "RootViewController.h"
#import "TableViewStandard.h"
#import "TableViewGrouped.h"
#import "Simple.h"
#import "Rounded.h"
#import "Border.h"
#import "BorderRounded.h"


@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"ZSImageView";
}


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

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return 4;
	}
	
	 return 2;
	
}//ends


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
    
	// Configure the cell.
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			cell.textLabel.text = @"Simple Image Load";
		} else if (indexPath.row == 1) {
			cell.textLabel.text = @"Rounded Edges";
		} else if (indexPath.row == 2) {
			cell.textLabel.text = @"Borders";
		}else if (indexPath.row == 3) {
			cell.textLabel.text = @"Rounded w/ Borders";
		}
	} else if (indexPath.section == 1) {
		if (indexPath.row == 0) {
			cell.textLabel.text = @"TableView - Standard";
		} else if (indexPath.row == 1) {
			cell.textLabel.text = @"TableView - Grouped";
		}
	}//end

    return cell;
}

/**
 * Sets the title for section headers
 *
 * @version $Revision: 0.1
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if (section == 0) {
		return @"Standard Demos";
	} else if (section == 1) {
		return @"TableView Demos";
	}
	
	return nil;
	
}//end


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			Simple *simple = [[Simple alloc] init];
			simple.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
			[self.navigationController pushViewController:simple animated:YES];
			[simple release];
		} else if (indexPath.row == 1) {
			Rounded *rounded = [[Rounded alloc] init];
			rounded.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
			[self.navigationController pushViewController:rounded animated:YES];
			[rounded release];
		} else if (indexPath.row == 2) {
			Border *border = [[Border alloc] init];
			border.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
			[self.navigationController pushViewController:border animated:YES];
			[border release];
		} else if (indexPath.row == 3) {
			BorderRounded *rb = [[BorderRounded alloc] init];
			rb.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
			[self.navigationController pushViewController:rb animated:YES];
			[rb release];
		}
	} else if (indexPath.section == 1) {
		if (indexPath.row == 0) {
			TableViewStandard *tvs = [[TableViewStandard alloc] initWithStyle:UITableViewStylePlain];
			tvs.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
			[self.navigationController pushViewController:tvs animated:YES];
			[tvs release];
		} else if (indexPath.row == 1) {
			TableViewGrouped *tvg = [[TableViewGrouped alloc] initWithStyle:UITableViewStyleGrouped];
			tvg.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
			[self.navigationController pushViewController:tvg animated:YES];
			[tvg release];
		}
	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

