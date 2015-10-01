//
//  UserPresenter.h
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import "Presenter.h"
#import "User.h"
@protocol ILoginView;
@protocol ILoginRepository;


@interface LoginPresenter : Presenter


@property(nonatomic, strong) id<ILoginView> loginView;
@property(nonatomic, strong) id<ILoginRepository> loginRepository;
@property(nonatomic,strong) NSMutableDictionary *mutableRetrievedDictionary;

- (LoginPresenter *)initWithLoginRepository:(id <ILoginRepository>)loginRepository andLoginView:(id <ILoginView>)loginView;

-(void)displayLoginScreen;
-(void)loginTapped: (User *)user;
-(BOOL)isValidUser:(User*)user ;
-(void)createLoggedInUserDictInUserDefaults : (NSString *)userId andPassword : (NSString *)password;
-(NSString*)fetchLoggedInStatus;
-(void)updateLoggedInStatus : (NSString *)loginStatus;

@end
