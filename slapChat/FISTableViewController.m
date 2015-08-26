//
//  FISTableViewController.m
//  slapChat
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISTableViewController.h"
#import "FISDataStore.h"
#import "Message.h"

@interface FISTableViewController ()

@property (nonatomic, strong) FISDataStore *dataManager;

@end

@implementation FISTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.dataManager = [FISDataStore sharedDataStore];

    
    BOOL isFirstRun = YES;
    isFirstRun = NO;
    
        // Step 6. Display the contents of each message in the textLabel.text of each cell.
    NSFetchRequest *fetchMessage = [NSFetchRequest fetchRequestWithEntityName:@"Message"];
    NSError *error = nil;
        //Initial dummy data management.
    if (isFirstRun) {
        [self setupDummyData];
    }
    

    self.messages = [self.dataManager.managedObjectContext executeFetchRequest:fetchMessage error:&error];
}

-(void)setupDummyData {
    Message *message1 = [NSEntityDescription insertNewObjectForEntityForName:@"Message"
                                                      inManagedObjectContext:self.dataManager.managedObjectContext];
    
    Message *message2 = [NSEntityDescription insertNewObjectForEntityForName:@"Message"
                                                      inManagedObjectContext:self.dataManager.managedObjectContext];
    
    Message *message3 = [NSEntityDescription insertNewObjectForEntityForName:@"Message"
                                                      inManagedObjectContext:self.dataManager.managedObjectContext];
    
    message1.content = @"Brownian movie-ing: when a huge gap in plausibility is made digestible by breaking it down into parts small enough that each chunk only asks for a small suspension of disbelief";
    message1.createdAt = [NSDate date];
    
    message2.content = @"So I’m finally going back to tackle CoreData, a monster growing bigger in my imagination with each day that I found good reasons to avoid it. I couldn’t pretend to have better things to do after a picture of CoreData was captured by the Insecurity app - clearly CoreData was making me feel insecure. So I do what I always do in these situations: I ask myself “What would Batman do?” Batman would dress up as CoreData and make a lair in a SQLite DB, that’s what! So I start 3 things at once (ADHD, yeah!): sample project, lab/video, and jumping on the hyperlinked-hamster-wheel that are The Docs.\n`tl;dr` And that’s when, after about half an hour, I had a funny, backwards thought: “Wow, I know 80% of this stuff already!: CoreData is just like Parse!” Those Apple copycats. :stuck_out_tongue_winking_eye:\"";
    message2.createdAt = [NSDate date];
    
    message3.content = @"I'm glad it all worked out --Future You";
    message3.createdAt = [NSDate distantFuture];
    
        //Save the context.
    [self.dataManager saveContext];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseID" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (self.messages[indexPath.row]) {
        Message *message = self.messages[indexPath.row];
        cell.textLabel.text = message.content;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
