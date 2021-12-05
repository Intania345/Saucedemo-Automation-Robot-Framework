*** Settings ***
Library                   SeleniumLibrary
Resource                  ../Resources/login_pages.robot
Library                   DataDriver    ../Resources/login_credentials_valid.csv    sheet_name=Sheet1
Test Setup                Open Browser    ${WebURL}   ${BROWSER}
Test Teardown             Close Browser
Test Template             I want to go to About Page

*** Variables ***
${BROWSER}                Chrome
${WebURL}                 https://www.saucedemo.com/

*** Keywords ***
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

*** Test Cases ***
I want to go to About Page         ${username}     ${password}
    Then I click button About      id=react-burger-menu-btn        id=about_sidebar_link
