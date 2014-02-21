//
//  EditPostViewController.m
//  Applying_MVC
//
//  Created by Matthew Voss on 2/14/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import "PostEditViewController.h"
#import "Post.h"

@interface PostEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *PostTitle;
@property (weak, nonatomic) IBOutlet UITextView *PostContent;

@end

@implementation PostEditViewController

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
    self.PostTitle.text = self.post.title;
    self.PostContent.text = self.post.content;
    self.view.backgroundColor = self.post.color;
    
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


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if ((![self.post.content isEqualToString: self.PostContent.text]) || (![self.post.title isEqualToString:self.PostTitle.text])) {
        _post.content = self.PostContent.text;
        _post.title = self.PostTitle.text;
        _post.timeStamp = [NSDate date];
        [_post ChangeEditFlag:(_post)];
    }
}

@end
