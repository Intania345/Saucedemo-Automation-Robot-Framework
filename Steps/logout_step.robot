*** Settings ***
Library                   SeleniumLibrary
Resource                  ../Resources/login_pages.robot
Library                   DataDriver    ../Resources/login_credentials_valid.csv    sheet_name=Sheet1
Test Setup                Open Browser    ${WebURL}   ${BROWSER}
Test Teardown             Close Browser
Test Template             I want to logout

*** Variables ***
${BROWSER}                Chrome
${WebURL}                 https://www.saucedemo.com/

*** Keywords ***
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

*** Test Cases ***
I want to logout                    ${username}     ${password}
    Then I click menu button        id=react-burger-menu-btn        
    And I click logout button       id=logout_sidebar_link
