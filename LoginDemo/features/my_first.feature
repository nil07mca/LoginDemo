Feature: Login
    As a mobile application user,
    I want to see the option to Sign-In or Register in the welcome screen
    As an user want to do the login
    As an user to see the warning dialog when enters the invalid credential
    As an user to retain my last session within 1hr
    As an user to see the welcome page if app does not used within 1hr
    I want to see the landing page and have the logout option
    I want to logout from the application

Scenario: I want to see the option to Sign-In or Register in the welcome screen
    Given As an user open the install the app in the my mobile
    When  I launch the app at first time
    Then  I see the welcome screen
    Then  I Should see the Login/Signup options

Scenario: Login steps with out creadentials
    Given I am on the Home Screen
    When I touch the "Login" button
    And I touch the "Login"

Scenario: Login steps with wrong creadentials
    Given I am on the Home Screen to test wrong credential

Scenario: Login steps with correct creadentials
Given I am on the Home Screen to test correct credential

Scenario: I want to see landing page and have the logout option
Given I am on the Details Screen to test logout

Scenario: I want to see back button working
Given I am on the Login Screen press back button