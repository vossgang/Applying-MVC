//
//  Posts.m
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import "Posts.h"

@implementation Posts


-(Posts *)createPost:(int )newpost
{

    Posts *newPost = [[Posts alloc]init];
    
        newPost.userName = [NSString stringWithFormat:@"User number %d", newpost];
        newPost.title    = [NSString stringWithFormat:@"The Title %d is missing", newpost];
        newPost.timeStamp = [NSDate date];
        newPost.content   = [NSString stringWithFormat:@"Content to go here in %d days", newpost];    
    
    return newPost;
}

@end
