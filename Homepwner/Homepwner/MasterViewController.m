//
//  MasterViewController.m
//  Homepwner
//
//  Created by Asano Satoshi on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "PossessionStore.h"
#import "Possession.h"

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 10; i++) {
            [[PossessionStore defaultStore] createPossession];
        }   
    }
    return self;
}

-(id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)insertNewObject:(id)sender
{
    [[PossessionStore defaultStore] createPossession];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[[[PossessionStore defaultStore] allPossessions] count] - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[PossessionStore defaultStore] allPossessions] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    Possession *p = [[[PossessionStore defaultStore] allPossessions] objectAtIndex:indexPath.row];    
    cell.textLabel.text = [p description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[PossessionStore defaultStore] removePossession:[[[PossessionStore defaultStore] allPossessions] objectAtIndex:indexPath.row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    }
    Possession *p = [[[PossessionStore defaultStore] allPossessions] objectAtIndex:indexPath.row];
    self.detailViewController.possession = p;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
