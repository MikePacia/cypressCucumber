@login
Feature: This feature file will be used to test the login related scenarios

    @login_success
    Scenario: Login Success

        Given I have launched the swag labs application
        When I enter the correct username and password
        And I click the log in button
        Then I should land on the products page

    @login_failure
    Scenario: Login Failure

        Given I have launched the swag labs application
        When I enter the incorrect username and password
        And I click the log in button
        Then  I should get the error message "Epic sadface: Username and password do not match any user in this service"