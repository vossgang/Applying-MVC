//
//  PostEntryViewController.m
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import "PostEntryViewController.h"
#import "Post.h"
#import "PostTableViewController.h"

@interface PostEntryViewController ()


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
    self.view.backgroundColor = self.post.color;
    self.PostContent.backgroundColor = self.post.color;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setPost:(Post *)post
{
    _post = post;
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    _post.content = self.PostContent.text;
    _post.title = self.PostTitle.text;
    _post.userName = self.UserName.text;
    _post.timeStamp = [NSDate date];
    
}


@end
