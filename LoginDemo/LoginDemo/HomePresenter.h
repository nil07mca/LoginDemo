//
//  WelcomePresenter.h
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import "Presenter.h"
#import "User.h"

@protocol IHomeView;

@interface HomePresenter : Presenter


@property(nonatomic, strong) id<IHomeView> homeView;
@property(nonatomic,strong) NSMutableDictionary *mutableRetrievedDictionary;

- (HomePresenter *)initHomeView:(id <IHomeView>)homeView;

-(void)logOutTapped;
-(void)displayUserName :(User *)user;
@end
