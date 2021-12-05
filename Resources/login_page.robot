*** Settings ***
Library                    SeleniumLibrary
Variables                  login_locators.yaml

*** Variables ***
${BROWSER}              Chrome
${WebURL}               https://www.saucedemo.com/

*** Keywords ***
Open Browser to WebSauceDemo
    Open Browser    ${WebURL}   ${BROWSER}
    Maximize browser window
Close my Browsers
    Close Browser
Input Username
    [Arguments]     ${username}
    Input Text      ${txtUsername}    ${username}
Input Password
    [Arguments]     ${password}
    Input Text      ${txtPassword}    ${password}
Click button login
    Click Element   ${btnLogin}
    Sleep    2s
Verify on Login page
    Page Should Contain    Accepted usernames are:
Shoud showing dashboard
    Page Should Contain    Sauce Labs Backpack
Should showing error login
    Page Should Contain    Username and password do not match any user in this service
Should showing username required
    Page Should Contain    Username is required 
Should showing password required
    Page Should Contain    Password is required