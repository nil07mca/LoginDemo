//
//  IHomeView.h
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//
#import "User.h"

@protocol IHomeView <NSObject>

@required
- (void)displayUser:(User*)user;
- (void)logOut;
@end
