*** Settings ***
Library                   SeleniumLibrary
Resource                  ../Resources/login_pages.robot
Library                   DataDriver    ../Resources/login_credentials_valid.csv    sheet_name=Sheet1
#Library                   DataDriver    ../Resources/form_fill.csv      shee_name=Sheet1
Test Setup                Open Browser    ${WebURL}   ${BROWSER}
Test Teardown             Close Browser

*** Variables ***
${BROWSER}                Chrome
${WebURL}                 https://www.saucedemo.com/
${FIRSTNAME}              User
${LASTNAME}               A
${POSTALCODE}             12345

*** Keywords ***
I want to checkout product on cart
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Sleep                   1s
    Capture Page Screenshot
    Page Should Contain     Sauce Labs Backpack
    Click Element           (//div[@class='inventory_item_name'])[1]
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=add-to-cart-sauce-labs-backpack
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=shopping_cart_container
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=checkout
    Sleep                   1s
    Capture Page Screenshot
    Input Text              id=first-name       ${FIRSTNAME}
    Input Text              id=last-name        ${LASTNAME}
    Input Text              id=postal-code      ${POSTALCODE}
    Click Element           id=continue
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=finish
    Sleep                   1s
    Capture Page Screenshot 
    Click Element           id=back-to-products
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=react-burger-menu-btn   
    Sleep                   1s   
    Click Element           id=logout_sidebar_link
    Sleep                   1s
    Capture Page Screenshot

*** Test Cases ***
I want to checkout product on cart        
    [Template]                            I want to checkout product on cart
    First, I want to login                ${username}     ${password}
    Then I click on of product            (//div[@class='inventory_item_name'])[2]
    Click Add to Cart button              id=add-to-cart-sauce-labs-bike-light
    Click cart button                     id=shopping_cart_container
    Then I click checkout button          id=checkout
    And I fill first name field           ${FIRSTNAME}       
    And I fill last name field            ${LASTNAME}         
    And I fill postal code field          ${POSTALCODE}
    Then I click continue button          id=continue
    I click finis button                  id=finish
    Then I back to home                   id=back-to-products
    Then I click menu logout              id=react-burger-menu-btn       
    I click logout button                 id=logout_sidebar_link


    

