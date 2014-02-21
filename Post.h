//
//  Posts.h
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding>

@property (nonatomic, strong) NSString  *userName;
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *content;
@property (nonatomic, strong) NSDate    *timeStamp;
@property (nonatomic, strong) UIColor   *color;
@property (nonatomic, strong) NSString  *editFlag;
@property (nonatomic, strong) NSString  *deleteFlag;


-(Post *)createPost:(int )postNumber;
-(void)PostInit:(Post *)newpost;
-(void)ChangeEditFlag:(Post *)thisPost;
-(void)SetDeleteFlag:(Post *)thisPost;

-(UIColor *)lightenPostColor:(Post *)postToLighten;
-(UIColor *)darkenPostColor:(Post *)postToDarken;
-(void)ChangePostColor:(Post *)postToChange;


@end
