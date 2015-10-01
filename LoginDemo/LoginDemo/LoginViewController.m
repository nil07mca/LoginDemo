//
//  LoginViewController.m
//  LoginDemo
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRepository.h"
#import "HomeViewController.h"


@interface LoginViewController ()
- (LoginPresenter *)delegateDependencyInjectionToAnIocContainer;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)loginButtonTapped:(id)sender;


@end



@implementation LoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.userNameTextField.delegate =self;
    self.passwordTextField.delegate =self;
    _presenter = [self delegateDependencyInjectionToAnIocContainer];
}

- (void)displayLogin:(User *)user {
    _user = user;
}

-(void)displayHomeScreen:(User *)user
{
    UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *homeVC =(HomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
    homeVC.user = user;
    [self.navigationController pushViewController:homeVC animated:YES];
}

- (void)displayErrorMessage:(NSString *)errorMessage
{
    UIAlertView *alertView =[[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}


- (LoginPresenter *)delegateDependencyInjectionToAnIocContainer {
    id<ILoginRepository> loginRepository = [[LoginRepository alloc] init];
    LoginPresenter *const presenter = [[LoginPresenter alloc]initWithLoginRepository:loginRepository andLoginView:self];
    return presenter;
}

- (IBAction)loginButtonTapped:(id)sender {
    
    
    if ([self.userNameTextField.text length]>0)
    {
        
        if([self.passwordTextField.text length]>0)
        {
            User *user =[User userWithName:self.userNameTextField.text password:self.passwordTextField.text];
            
           LoginPresenter *loginPresenter =[self delegateDependencyInjectionToAnIocContainer];
            
            [loginPresenter loginTapped:user];
        }
        else
        {
            [self displayErrorMessage:@"Please enter password"];
        }
        
        
    }
    else
    {
        [self displayErrorMessage:@"Please enter username"];
    }
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
