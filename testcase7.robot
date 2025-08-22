# Create New Account Link → Verifies signup form appears.
*** Settings ***
Library    Browser

*** Test Cases ***
Create New Account Link
    [Documentation]    Verify that clicking 'Sign up for Facebook' opens the signup form
    Open Facebook Login Page
    Click Sign Up Link
    Verify Signup Form Is Visible
    Close Browser Session

*** Keywords ***
Open Facebook Login Page
    New Browser    chromium    headless=False
    New Page    https://www.facebook.com/login.php

Click Sign Up Link
    Click    text=Sign up for Facebook

Verify Signup Form Is Visible
    Wait For Elements State    input[name="firstname"]    visible    5s

Close Browser Session
    Close Browser
