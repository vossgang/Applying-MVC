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

@interface PostEntryViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>


@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *PostTitle;
@property (weak, nonatomic) IBOutlet UITextField *PostContent;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

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
    _post.postImage = self.imageview.image;
    
}
- (IBAction)takePicture:(id)sender {
    
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIActionSheet *actoinSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Sorce Type"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Photo Library", @"Camera", nil];
        [actoinSheet showFromBarButtonItem:sender animated:YES];
    } else {
        [self showPickerWithSorceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    }
    
}

- (void)showPickerWithSorceType:(UIImagePickerControllerSourceType)sorceType
{
    UIImagePickerController *picker = [UIImagePickerController new];
    
    picker.sourceType = sorceType;
    
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:Nil];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Camera"]) {
        [self showPickerWithSorceType:(UIImagePickerControllerSourceTypeCamera)];
    } else if ([buttonTitle isEqualToString:@"Photo Library"]){
        [self showPickerWithSorceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        self.imageview.image = [info objectForKey:UIImagePickerControllerEditedImage];
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIControl *control in self.view.subviews) {
        if ([control isKindOfClass:[UITextField class]]) {
            [control endEditing:YES];
        } else if ([control isKindOfClass:[UITextView class]])
            [control endEditing:YES];
    }
}

@end
