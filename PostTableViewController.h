//
//  PostViewController.h
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostTableViewController : UITableViewController

@property (nonatomic, weak) Post *enteredPost;

@end
