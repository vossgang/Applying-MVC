//
//  PostViewController.m
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import "PostTableViewController.h"
#import "Post.h"
#import "PostDetailViewController.h"
#import "PostEntryViewController.h"

@interface PostTableViewController ()

@property (nonatomic, strong) NSMutableArray *posts;

@end

@implementation PostTableViewController

@synthesize enteredPost;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadFromFile];
    
    if (self.posts.count == 0) {
        NSLog(@"%ld posts", self.posts.count);
//        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"saveInfo" ofType:@"txt"];
//        [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:filePath error:nil];
        NSMutableArray *newPosts = [NSMutableArray new];
        Post *nextPost = [[Post alloc]init];
        nextPost = [nextPost createPost:1];
        [newPosts insertObject:nextPost atIndex:0];
        self.posts = newPosts;
    }

//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setInteger:self.posts.count forKey:@"numberofposts"];
    //do this to save basic types
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)DeleteAllPosts:(id)sender {
    
    NSMutableArray *newPosts = [NSMutableArray new];
    
    for(int i = 0; i < 7; i++){
        Post *nextPost = [[Post alloc]init];
        
        nextPost = [nextPost createPost:(i+1)];
        [newPosts insertObject:nextPost atIndex:i];
    }
    
    self.posts = newPosts;
    
    [self.tableView reloadData];
    [self saveToFile];
    
    
}




-(void)viewWillAppear:(BOOL)animated{

    
    [super viewWillAppear:animated];
    
    [self checkForChange];
    [self checkForDelete];
    
//    [self loadOrSave:@"Save"];
    [self saveToFile];
    
    [self.tableView reloadData];
    
}


-(void)saveToFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"save.plist"];
    [NSKeyedArchiver archiveRootObject:self.posts toFile:appFile];
}

-(void)loadFromFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"save.plist"];
    NSMutableArray *myArray  = [NSKeyedUnarchiver unarchiveObjectWithFile:appFile];
    self.posts = myArray;

}




-(void)saveToDisk
{
    
    NSString *filePath = [[self documentsDirectory] stringByAppendingPathComponent:@"saveInfo.txt"];
    [NSKeyedArchiver archiveRootObject:self.posts toFile:filePath];
    
}

-(NSString *)documentsDirectory{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *results = [fileManager URLsForDirectory:NSDocumentationDirectory inDomains:NSUserDomainMask];
    NSURL *documentsURL = [results lastObject];
    return documentsURL.path;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Post *post = [self.posts objectAtIndex:indexPath.row];
    cell.textLabel.text = post.userName;
    cell.detailTextLabel.text = post.title;
    cell.contentView.backgroundColor = post.color;
    return cell;
}



-(void)checkForChange{
    
    for (int i = 0; i < self.posts.count; i++) {
        Post *checkEdit = [self.posts objectAtIndex:i];
        if (checkEdit.editFlag) {
            [[self.posts objectAtIndex:i] ChangeEditFlag:([self.posts objectAtIndex:i])];
            [self.posts insertObject:[self.posts objectAtIndex:i] atIndex:0];
            [self.posts removeObjectAtIndex:(i+1)];
        }
    }


}-(void)checkForDelete{
    
    for (int i = 0; i < self.posts.count; i++) {
        Post *checkDelete = [self.posts objectAtIndex:i];
        if (checkDelete.deleteFlag) {
            [self.posts removeObjectAtIndex:(i)];
        }
    }
}



/*
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 22;
}
*/

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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        PostDetailViewController *detail = segue.destinationViewController;
        NSInteger row = [self.tableView indexPathForSelectedRow].row;
        Post *post = [self.posts objectAtIndex:row];
        detail.post = post;
        
    } else if ([segue.identifier isEqualToString:@"enterNewPost"]){
        
        PostEntryViewController *entry = segue.destinationViewController;
        Post *nextPost = [[Post alloc] init];
        [nextPost PostInit:nextPost];
        [self.posts insertObject:nextPost atIndex:0];
        entry.post = nextPost;
    }
}



//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//   
//    return documentsDirectory;


@end
