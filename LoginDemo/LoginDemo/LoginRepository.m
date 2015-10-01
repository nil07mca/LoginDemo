//
//  LoginRepository.m
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import "LoginRepository.h"

@implementation LoginRepository

-(User *)populateLogin
{
    User *user =[User userWithName:@"Jane Doe" password:@"123"];
    return user;
}

@end
