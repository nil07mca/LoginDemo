//
//  LoginDemoTests.m
//  LoginDemoTests
//
//  Created by CTS on 01/10/15.
//  Copyright (c) 2015 cts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "User.h"
#import "LoginRepository.h"
#import "LoginViewController.h"

@interface LoginDemoTests : XCTestCase {
    LoginViewController* loginViewController ;
}

@end

@implementation LoginDemoTests

- (void)setUp {
    [super setUp];
    loginViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginVC"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    loginViewController = nil ;
    [super tearDown];
}


#pragma mark - User
- (void)testuserWithName {
    User* user = [User userWithName:@"Username" password:@"Password"];
    XCTAssertNotNil(user);
    
    NSString* strUsername = user.userName ;
    NSString* strPassword = user.password ;
    
    XCTAssertEqualObjects(strUsername, @"Username");
    XCTAssertEqualObjects(strPassword, @"Password");
}


#pragma mark - LoginRepo
- (void)testpopulateLogin {
    LoginRepository* repo = [[LoginRepository alloc] init];
    XCTAssertNotNil(repo);
    
    User* user = [repo populateLogin];
    XCTAssertNotNil(user);
    
    NSString* strUsername = user.userName ;
    NSString* strPassword = user.password ;
    
    XCTAssertEqualObjects(strUsername, @"Jane Doe");
    XCTAssertEqualObjects(strPassword, @"123");
}

#pragma mark - LoginViewController
-(void)testdisplayErrorMessage {
    [loginViewController displayErrorMessage:@"Test Error Message"];
}

#pragma mark - TestValidUser
-(void)testValidUser
{
    User* user = [User userWithName:@"Jane Doe" password:@"123"];
    id<ILoginRepository> loginRepository = [[LoginRepository alloc] init];
    LoginPresenter *const presenter = [[LoginPresenter alloc]initWithLoginRepository:loginRepository andLoginView:loginViewController];
    BOOL isValid = [presenter isValidUser:user];
    XCTAssertTrue(isValid);
}

#pragma mark - TestLoggedInStatus
-(void)testLoginStatus {
    id<ILoginRepository> loginRepository = [[LoginRepository alloc] init];
    LoginPresenter *const presenter = [[LoginPresenter alloc]initWithLoginRepository:loginRepository andLoginView:loginViewController];
    NSString*  loginStatus = [presenter fetchLoggedInStatus];
    XCTAssertNotEqualObjects(loginStatus, @"loggedIn");
   
}


@end
