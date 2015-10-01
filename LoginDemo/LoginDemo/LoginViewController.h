//
//  LoginViewController.h
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "LoginPresenter.h"
#import "ILoginView.h"

@interface LoginViewController : UIViewController<ILoginView,UITextFieldDelegate>

@property (nonatomic, strong) User * user;


@property (weak, nonatomic) IBOutlet LoginPresenter *presenter;

-(BOOL)isValidUser:(User*)user ;
@end
