'''
Open Facebook login page → navigate to login.php.

Wait for input fields → ensures page is loaded.

Click login without filling anything → simulates empty field login attempt.

Wait for error container (div._9ay7) → Facebook displays error in this element.

Validate error text → should mention missing account/email.

Close browser → clean up.
'''
*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}            chromium
${HEADLESS}           false
${LOGIN_URL}          https://www.facebook.com/login.php
${EMAIL_FIELD}        input[name="email"]
${PASSWORD_FIELD}     input[name="pass"]
${LOGIN_BUTTON}       button[name="login"]
${ERROR_DIV}          div._9ay7
${EXPECTED_ERROR_PART}     isn't connected to an account

*** Keywords ***
Open Facebook Login Page
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page    ${LOGIN_URL}

Login Without Credentials
    Wait For Elements State    ${EMAIL_FIELD}    visible    5s
    Wait For Elements State    ${PASSWORD_FIELD}    visible    5s
    Click    ${LOGIN_BUTTON}

Verify Error Message
    Wait For Elements State    ${ERROR_DIV}    visible    5s
    ${error_msg}=    Get Text    ${ERROR_DIV}
    Log    Error text shown: ${error_msg}
    Should Contain    ${error_msg}    ${EXPECTED_ERROR_PART}

Close Facebook Browser
    Close Browser

*** Test Cases ***
Login With Empty Fields
    [Documentation]    Verify Facebook shows error when trying to login without entering email or password
    Open Facebook Login Page
    Login Without Credentials
    Verify Error Message
    Close Facebook Browser

