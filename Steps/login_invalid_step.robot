*** Settings ***
Library                   SeleniumLibrary
Resource                  ../Resources/login_pages.robot
Library                   DataDriver    ../Resources/login_credentials_invalid.csv    sheet_name=Sheet1
Test Setup                Open Browser    ${WebURL}   ${BROWSER}
Test Teardown             Close Browser
Test Template             I want to login with invalid credentials

*** Variables ***
${BROWSER}                Chrome
${WebURL}                 https://www.saucedemo.com/

*** Keywords ***
I want to login with invalid credentials
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Capture Page Screenshot
    Page Should Contain     Epic sadface: Username and password do not match any user in this service 

*** Test Cases ***
Login with invalid credentials should failed with CSV file      ${username}     ${password}
