//
//  HomeViewController.m
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import "HomeViewController.h"
#import "HomePresenter.h"

@interface HomeViewController ()
{
    NSTimer     *myidleTimer;
}
- (IBAction)homeButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HomePresenter *homePresenter =[[HomePresenter alloc] initHomeView:self];
    [homePresenter displayUserName:self.user];
    
    self.navigationItem.hidesBackButton =YES;

    
    [self resetIdleTimer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidTimeout:) name:kApplicationDidTimeoutNotification object:nil];
    
}

-(void)resetIdleTimer
{
    if (myidleTimer)
    {
        [myidleTimer invalidate];
    }
    //convert the wait period into minutes rather than seconds
    double timeout = kApplicationTimeoutInMinutes ;
    myidleTimer = [NSTimer scheduledTimerWithTimeInterval:timeout target:self selector:@selector(idleTimerExceeded) userInfo:nil repeats:NO];
    
}

//if the timer reaches the limit as defined in kApplicationTimeoutInMinutes, post this notification
-(void)idleTimerExceeded
{
    if (myidleTimer)
    {
        [myidleTimer invalidate];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kApplicationDidTimeoutNotification object:nil];
}

-(void)displayUser:(User *)user
{
    self.userNameLabel.text =user.userName;
}

-(void)logOut
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}



- (IBAction)homeButtonTapped:(id)sender {
    
    HomePresenter *homePresenter =[[HomePresenter alloc] initHomeView:self];
    [homePresenter logOutTapped];
}

-(void)applicationDidTimeout : (NSNotification *)notif
{
    [self logOut];
}

@end
