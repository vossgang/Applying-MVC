//
//  MVViewController.m
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import "MVViewController.h"

@interface MVViewController ()

@property (weak, nonatomic) IBOutlet UITextView *postInfo;


@end

@implementation MVViewController

@synthesize thispost;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Posts *newpost = thispost;
    
    
    self.postInfo.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@", newpost.userName, newpost.title, newpost.content, newpost.timeStamp];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)GoBack:(id)sender {

    [self dismissViewControllerAnimated:YES completion:Nil];

}

@end
