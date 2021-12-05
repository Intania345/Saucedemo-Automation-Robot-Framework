*** Settings ***
Library                   SeleniumLibrary
Resource                  ../Resources/login_pages.robot
Library                   DataDriver    ../Resources/login_credentials_valid.csv    sheet_name=Sheet1
Test Setup                Open Browser    ${WebURL}   ${BROWSER}
Test Teardown             Close Browser
Test Template             I want to login with valid credentials

*** Variables ***
${BROWSER}                Chrome
${WebURL}                 https://www.saucedemo.com/

*** Keywords ***
I want to login with valid credentials
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Capture Page Screenshot
    Page Should Contain      Sauce Labs Backpack

*** Test Cases ***
Login with valid credentials       ${username}     ${password}
