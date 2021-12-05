*** Settings ***
Library                   SeleniumLibrary
Resource                  ../Resources/login_pages.robot
Library                   DataDriver    ../Resources/login_credentials_valid.csv    sheet_name=Sheet1
Test Setup                Open Browser    ${WebURL}   ${BROWSER}
Test Teardown             Close Browser

*** Variables ***
${BROWSER}                Chrome
${WebURL}                 https://www.saucedemo.com/
${FIRSTNAME}              User
${LASTNAME}               A
${POSTALCODE}             12345

*** Keywords ***
I want to continue shopping
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
    Click Element           id=continue-shopping
    Sleep                   1s
    Click Element           id=add-to-cart-sauce-labs-bolt-t-shirt
    Sleep                   1s
    Capture Page Screenshot 
    Click Element           id=add-to-cart-sauce-labs-onesie
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
I want to continue shopping        
    [Template]                            I want to continue shopping
    First, I want to login                ${username}     ${password}
    Then I click on of product            (//div[@class='inventory_item_name'])[2]
    Click Add to Cart button              id=add-to-cart-sauce-labs-bike-light
    Click cart button                     id=shopping_cart_container
    I want to continue shopping           id=continue-shopping
    And I added to cart one item          id=add-to-cart-sauce-labs-bolt-t-shirt
    And I added to cart another item      id=add-to-cart-sauce-labs-onesie
    Then I go to cart again               id=shopping_cart_container
    Then I click checkout button          id=checkout
    And I fill first name field           ${FIRSTNAME}       
    And I fill last name field            ${LASTNAME}         
    And I fill postal code field          ${POSTALCODE}
    Then I click continue button          id=continue
    I click finis button                  id=finish
    Then I back to home                   id=back-to-products
    Then I click menu logout              id=react-burger-menu-btn       
    I click logout button                 id=logout_sidebar_link


    

