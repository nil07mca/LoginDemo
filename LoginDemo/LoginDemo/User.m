//
//  User.m
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import "User.h"

@implementation User

+ (User *)userWithName:(NSString *)userName
                password:(NSString *)password
{
     User *user = [[User alloc] init];
     user.userName = userName;
     user.password = password;
    
    return user;
}

@end
