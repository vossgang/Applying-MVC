//
//  MVViewController.m
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import "PostDetailViewController.h"
#import "Post.h"
#import "PostEditViewController.h"

@interface PostDetailViewController ()


@property (weak, nonatomic) IBOutlet UITextView *PostContent;
@property (weak, nonatomic) IBOutlet UILabel *postUserName;
@property (weak, nonatomic) IBOutlet UILabel *PostDate;

@end


@implementation PostDetailViewController

- (IBAction)DeleteButton:(id)sender {
    
    [_post SetDeleteFlag:(_post)];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)ChangePostBackgroundColor:(id)sender {
    
    [self.post ChangePostColor:self.post];
    self.view.backgroundColor = self.post.color;
    self.PostContent.backgroundColor = self.post.color;
    
}

- (IBAction)DarkenPostColor:(id)sender {
    
    self.post.color = [self.post darkenPostColor:self.post];
    self.view.backgroundColor = self.post.color;
    self.PostContent.backgroundColor = self.post.color;
    
}


- (IBAction)LightenPostColor:(id)sender {
    
    self.post.color = [self.post lightenPostColor:self.post];
    self.view.backgroundColor = self.post.color;
    self.PostContent.backgroundColor = self.post.color;

}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = self.post.color;
    self.PostContent.backgroundColor = self.post.color;
    
    // Do any additional setup after loading the view, typically from a nib.
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

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.postUserName.text = _post.userName;
    self.PostContent.text = _post.content;
    self.navigationItem.title = _post.title;
    self.PostDate.text = [_post.timeStamp description];
    
};


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    _post.content = self.PostContent.text;
    _post.userName = self.postUserName.text;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
   if ([segue.identifier isEqualToString:@"EditPost"]){
        PostEditViewController *edit = segue.destinationViewController;
        edit.post = self.post;
    }
}



@end
