import { Given, When, Then, Before, After} from '@badeball/cypress-cucumber-preprocessor'


Given("I have launched the swag labs application", function () {
    cy.visit('https://www.saucedemo.com/v1/index.html')
})

When("I enter the correct username and password", function () {
    const username = '#user-name'
    const pword = '#password'

    cy.get(username).type('standard_user')
    cy.get(pword).type('secret_sauce')
})

When("I click the log in button", function () {
    const loginbtn = '#login-button'
    cy.get(loginbtn).click()
})
Then("I should land on the products page", function () {
    cy.get('div.product_label').should('have.text', 'Products')
})



//LOG IN FAILURE
When(`I enter the incorrect username and password`, () => {
    const username = '#user-name'
    const pword = '#password'

    cy.get(username).type('standard_user')
    cy.get(pword).type('secret_sauce122')
});


Then(`I should get the error message {string}`, (message) => {
    const error = 'h3'
    cy.get(error).contains(message)
});

/**
 * Data driven 
 */

When(`I enter the username {string}`, (userN) => {
    const username = '#user-name'
    cy.get(username).type(userN)
    
});

When(`I enter the wrong password {string}`, (pass) => {
    const pword = '#password'
    cy.get(pword).type(pass)
});
