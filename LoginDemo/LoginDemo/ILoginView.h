//
//  ILoginView.h
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//
#import "User.h"
@protocol ILoginView <NSObject>

@required
- (void)displayLogin:(User *)user;
- (void)displayErrorMessage:(NSString *)errorMessage;
- (void)displayHomeScreen:(User *)user;
@end