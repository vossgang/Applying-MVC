//
//  Posts.m
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import "Post.h"


@implementation Post


-(Post *)createPost:(int )postNumber
{

    Post *newPost = [[Post alloc]init];
    newPost.userName        = [NSString stringWithFormat:@"User number %d", postNumber];
    newPost.title           = [NSString stringWithFormat:@"The Title %d is missing", postNumber];
    newPost.timeStamp       = [NSDate date];
    newPost.content         = [NSString stringWithFormat:@"Content to go here in %d days", postNumber];
    newPost.postImage       = [UIImage new];
    newPost.imageFilePath   = [NSString new];
    [self ChangePostColor: newPost];
    
    return newPost;
}


-(void)PostInit:(Post *)newpost
{
    newpost.timeStamp = [NSDate date];
    [self ChangePostColor:newpost];
    
}


-(void)ChangeEditFlag:(Post *)thisPost{
    
    if (thisPost.editFlag) {
        thisPost.editFlag = NULL;
    } else {
        thisPost.editFlag = @"Edited";
    }
    
}

-(void)SetDeleteFlag:(Post *)thisPost{
    
    thisPost.deleteFlag = @"DeleteME";
    
}



-(void)ChangePostColor:(Post *)postToChange

{
    CGFloat r = arc4random_uniform(100) / (float)100;
    CGFloat g = arc4random_uniform(100) / (float)100;
    CGFloat b = arc4random_uniform(100) / (float)100;
    
    postToChange.color = [UIColor colorWithRed:r green:g blue:b alpha:1];
}


-(UIColor *)lightenPostColor:(Post *)postToLighten{
    
    UIColor *color = postToLighten.color;
    
    CGFloat amount = 1.1;
    
    CGFloat hue, saturation, brightness, alpha;
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        brightness += (amount-1.0);
        brightness = MAX(MIN(brightness, 1.0), 0.0);
        return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    }
    
    CGFloat white;
    if ([color getWhite:&white alpha:&alpha]) {
        white += (amount-1.0);
        white = MAX(MIN(white, 1.0), 0.0);
        return [UIColor colorWithWhite:white alpha:alpha];
    }
    
    return nil;
    
}
-(UIColor *)darkenPostColor:(Post *)postToDarken{
    
    UIColor *color = postToDarken.color;
    
    CGFloat amount = .9;
    
    CGFloat hue, saturation, brightness, alpha;
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        brightness += (amount-1.0);
        brightness = MAX(MIN(brightness, 1.0), 0.0);
        return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    }
    
    CGFloat white;
    if ([color getWhite:&white alpha:&alpha]) {
        white += (amount-1.0);
        white = MAX(MIN(white, 1.0), 0.0);
        return [UIColor colorWithWhite:white alpha:alpha];
    }
    
    return nil;
}


- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.userName      forKey:@"userName"];
    [encoder encodeObject:self.title         forKey:@"title"];
    [encoder encodeObject:self.content       forKey:@"content"];
    [encoder encodeObject:self.timeStamp     forKey:@"timeStamp"];
    [encoder encodeObject:self.color         forKey:@"color"];
    [encoder encodeObject:self.imageFilePath forKey:@"imageFilePath"];
    
    
}
- (id)initWithCoder:(NSCoder *)decoder
{
   
    if (self = [super init]) {
        self.userName      = [decoder decodeObjectForKey:@"userName"];
        self.title         = [decoder decodeObjectForKey:@"title"];
        self.content       = [decoder decodeObjectForKey:@"content"];
        self.timeStamp     = [decoder decodeObjectForKey:@"timeStamp"];
        self.color         = [decoder decodeObjectForKey:@"color"];
        self.imageFilePath = [decoder decodeObjectForKey:@"imageFilePath"];
    }
    return self;
}


@end
