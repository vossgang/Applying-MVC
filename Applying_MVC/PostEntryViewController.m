//
//  PostEntryViewController.m
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import "PostEntryViewController.h"
#import "Posts.h"
#import "PostViewController.h"

@interface PostEntryViewController ()

@property (nonatomic, strong) Posts *thisPost;
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *PostTitle;
@property (weak, nonatomic) IBOutlet UITextField *PostContent;

@end

@implementation PostEntryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)UserNameEntry:(id)sender {
    
    self.thisPost.userName = self.UserName.text;
    
}
- (IBAction)PostTitleEntry:(id)sender {
    
    self.thisPost.title = self.PostTitle.text;
}
- (IBAction)PostContentEntry:(id)sender {
    
    self.thisPost.content = self.PostContent.text;
    self.thisPost.timeStamp = [NSDate date];
}


@end
