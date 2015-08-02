//
//  QCFeed.h
//  QCTest
//
//  Created by Joe-c on 15/8/1.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QCFeed : NSObject
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *imageName;
@property (copy, nonatomic) NSString *time;
@end
