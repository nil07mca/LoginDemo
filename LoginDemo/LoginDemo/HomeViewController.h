//
//  HomeViewController.h
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IHomeView.h"

//the length of time before your application "times out". This number actually represents seconds, so we'll have to multiple it by 60 in the .m file
#define kApplicationTimeoutInMinutes 60*60*1

//the notification your AppDelegate needs to watch for in order to know that it has indeed "timed out"
#define kApplicationDidTimeoutNotification @"AppTimeOut"


@interface HomeViewController : UIViewController<IHomeView>

@property (nonatomic,strong)User *user;

@end
