//
//  ViewController.m
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "User.h"
#import "LoginPresenter.h"
#import "LoginRepository.h"
#import "HomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
//    
//    [self.navigationController.navigationBar setTranslucent:YES];
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
//    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
//    [self.navigationController.navigationBar
//     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    
   id<ILoginRepository> loginRepository = [[LoginRepository alloc] init];
    
   LoginPresenter *loginPresenter = [[LoginPresenter alloc]initWithLoginRepository:loginRepository andLoginView:self];
    NSString *status = [loginPresenter fetchLoggedInStatus];
    
    if ([status caseInsensitiveCompare:@"loggedIn"]==NSOrderedSame)
    {
        User *user =[loginRepository populateLogin];
        [loginPresenter loginTapped:user];
    }
    else
    {
        
    }

}

-(void)displayHomeScreen:(User *)user
{
    UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *homeVC =(HomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
    homeVC.user = user;
    [self.navigationController pushViewController:homeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"loginScene"]) {
        LoginViewController *controller = segue.destinationViewController;
        
        User *user =[User userWithName:@"Jane Doe" password:@"123"] ;
        controller.user = user;
    }
}

- (void)displayLogin:(User *)user
{
    
}
- (void)displayErrorMessage:(NSString *)errorMessage
{
    
}
@end
