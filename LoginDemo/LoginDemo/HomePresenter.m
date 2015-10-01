//
//  WelcomePresenter.m
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import "HomePresenter.h"
#import "IHomeView.h"

#define USERDEFAULTS_DICT_NAME @"loggedInUser"

@implementation HomePresenter


- (HomePresenter *)initHomeView:(id <IHomeView>)homeView
{
    if (self = [super init])
    {
        _homeView = homeView;
    }
    
    return self;
}

-(void)logOutTapped
{
    
    [self updateLoggedInStatus:@"loggedOut"];
    [self.homeView logOut];
}

-(void)displayUserName :(User *)user
{
    [self.homeView displayUser:user];
}

-(NSMutableDictionary *)mutableRetrievedDictionary
{
    _mutableRetrievedDictionary = [[[NSUserDefaults standardUserDefaults] objectForKey:USERDEFAULTS_DICT_NAME] mutableCopy];
    
    return _mutableRetrievedDictionary;
}

-(void)updateLoggedInStatus : (NSString *)loginStatus
{
    if (_mutableRetrievedDictionary ==nil)
    {
        _mutableRetrievedDictionary =[self mutableRetrievedDictionary];
    }
    
    if ([loginStatus length]>0)
    {
        [_mutableRetrievedDictionary setObject:loginStatus forKey:@"status"];
        
    }
    
    
    [[NSUserDefaults standardUserDefaults] setObject:_mutableRetrievedDictionary forKey:USERDEFAULTS_DICT_NAME];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
@end
