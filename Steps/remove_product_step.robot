*** Settings ***
Library                   SeleniumLibrary
Resource                  ../Resources/login_pages.robot
Library                   DataDriver    ../Resources/login_credentials_valid.csv    sheet_name=Sheet1
Test Setup                Open Browser    ${WebURL}   ${BROWSER}
Test Teardown             Close Browser

*** Variables ***
${BROWSER}                Chrome
${WebURL}                 https://www.saucedemo.com/

*** Keywords ***
I want to remove product on cart
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Sleep                   1s
    Capture Page Screenshot
    Page Should Contain     Sauce Labs Bike Light
    Click Element           id=add-to-cart-sauce-labs-bike-light
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=shopping_cart_container
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=remove-sauce-labs-bike-light
    Page Should Contain     Your Cart
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=react-burger-menu-btn   
    Sleep                   1s   
    Click Element           id=logout_sidebar_link
    Sleep                   1s
    Capture Page Screenshot

*** Test Cases ***
I want to remove product on cart
    [Template]                            I want to remove product on cart
    First, I want to login                ${username}     ${password}
    Then I click on of product            (//div[@class='inventory_item_name'])[1]
    Click Add to Cart button              id=add-to-cart-sauce-labs-backpack
    Click cart button                     id=shopping_cart_container
    Then I click checkout button          id=remove-sauce-labs-bike-light
    Sleep                                 2s
    Then I click menu logout              id=react-burger-menu-btn       
    I click logout button                 id=logout_sidebar_link


    

