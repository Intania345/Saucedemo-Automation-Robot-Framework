*** Settings ***
Library                    SeleniumLibrary
Variables                  login_locators.yaml

*** Variables ***
${BROWSER}              Chrome
${WebURL}               https://www.saucedemo.com/

*** Keywords ***
I want to login with invalid credentials
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Capture Page Screenshot
    Page Should Contain     Epic sadface: Username and password do not match any user in this service

I want to login with empty username
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Capture Page Screenshot
    Page Should Contain     Epic sadface: Username is required

I want to login with empty password
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Capture Page Screenshot
    Page Should Contain     Epic sadface: Password is required

I want to login with valid credentials
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Capture Page Screenshot
    Page Should Contain    Sauce Labs Backpack

I want to logout
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Sleep                   1s
    Capture Page Screenshot
    Page Should Contain     Sauce Labs Backpack
    Click Element           id=react-burger-menu-btn
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=logout_sidebar_link
    Sleep                   1s
    Capture Page Screenshot

I want to go to About Page
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Sleep                   1s
    Capture Page Screenshot
    Page Should Contain     Sauce Labs Backpack
    Click Element           id=react-burger-menu-btn
    Sleep                   1s
    Capture Page Screenshot
    Click Element           id=about_sidebar_link
    Sleep                   1s
    Capture Page Screenshot

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