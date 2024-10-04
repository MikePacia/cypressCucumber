@login
Feature: This feature file will be used to test the login related scenarios

    Background: Login
    Given I have launched the swag labs application

    @login_success
    Scenario: Login Success   
        When I enter the correct username and password
        And I click the log in button
        Then I should land on the products page

    @login_failure
    Scenario: Login Failure
        When I enter the incorrect username and password
        And I click the log in button
        Then  I should get the error message "Epic sadface: Username and password do not match any user in this service"

    @data_driven
    Scenario: error in login
        When I enter the username "standard_user"
        When I enter the wrong password "abc123"
        And I click the log in button
        Then  I should get the error message "Epic sadface: Username and password do not match any user in this service"
    @locked_user
    Scenario: error in login
        When I enter the username "locked_out_user"
        When I enter the wrong password "secret_sauce"
        And I click the log in button
        Then  I should get the error message "Epic sadface: Sorry, this user has been locked out."

    @exampless
    Scenario: using example
        When I enter the username "<Username>"
        When I enter the wrong password "<Password>"
        And I click the log in button
        Then  I should get the error message "<ErrorMessage>"

    Examples:
        | Username | Password | ErrorMessage |
        | standard_user  | secret_sauce2  | Epic sadface: Username and password do not match any user in this service  |
        | locked_out_user  | secret_sauce  | Epic sadface: Sorry, this user has been locked out.  |
