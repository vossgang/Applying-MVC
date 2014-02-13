//
//  Posts.h
//  Applying_MVC
//
//  Created by Matthew Voss on 2/12/14.
//  Copyright (c) 2014 Matthew Voss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Posts : NSObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate   *timeStamp;


-(Posts *)createPost:(int )newpost;

@end
