//
//  TableViewController.m
//  CoreDatsSample
//
//  Created by mehtab on 11/9/15.
//  Copyright (c) 2015 mehtab. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"
#import "Contact.h"
#import "CoreDataManager.h"
#import "PersistenceHelper.h"
#import "CoreDataContact.h"

@interface TableViewController (){

    NSMutableArray *names;
    NSMutableArray *phoneNo;
    NSManagedObjectContext *managedObjectContext;
    AppDelegate *appdelegate;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self initialize];
    [self setUpData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initialize {

    names = [NSMutableArray new];
    phoneNo = [NSMutableArray new];
    appdelegate = [[UIApplication sharedApplication] delegate];
    managedObjectContext = [[CoreDataManager sharedManager] managedObjectContext];
}

- (void) setUpData {
    
    NSArray *results = [PersistenceHelper getDataOfEntity:ContactEntity context:managedObjectContext];
    
    for (CoreDataContact *contact in results) {
        [names addObject:contact.name];
        [phoneNo addObject:contact.phoneNO];
    }
}

- (IBAction)onAddContact:(id)sender {
    
    Contact *contact = [Contact new];
    contact.name = @"Mehtab";
    contact.phone_no = @"03432179094";
    
    [names addObject:contact.name];
    [phoneNo addObject:contact.phone_no];
    
    [PersistenceHelper save:contact entity:ContactEntity context:managedObjectContext];
    [self.tableView reloadData];
 }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    if(names.count > 0)
       return names.count;
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [names objectAtIndex:indexPath.row];
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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
