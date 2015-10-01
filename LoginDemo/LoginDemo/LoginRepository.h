//
//  LoginRepository.h
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILoginRepository.h"

@interface LoginRepository : NSObject <ILoginRepository>

-(User *)populateLogin;
@end
