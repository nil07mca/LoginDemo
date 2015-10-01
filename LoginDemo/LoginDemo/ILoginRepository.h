//
//  ILoginRepository.h
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol ILoginRepository <NSObject>

@required
-(User *)populateLogin;

@end
