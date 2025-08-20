#Login with invalid password

#We’ll open Facebook login page, enter valid username (dummy email), wrong password, and check for the error message.🔎 Explanation

""" Open browser & navigate → opens Facebook login page.

Fill Text → enters dummy email & invalid password.

Click login → submits login form.

Wait For Elements State → waits for error message container (div._9ay7) to appear.

Get Text + Should Contain → checks error message contains “The password you’ve entered is incorrect”.

Close Browser → cleans up after test. """

*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://www.facebook.com/login/
${USERNAME}    testuser@example.com
${PASSWORD}    wrongpassword

*** Test Cases ***
Login With Invalid Password
    [Documentation]    Verify Facebook shows error for invalid password
    New Browser    chromium    headless=False
    New Page    ${URL}

    Fill Text    input#email    ${USERNAME}
    Fill Text    input#pass    ${PASSWORD}

    # ✅ Use unique ID for login button
    Wait For Elements State    #loginbutton    visible    5s
    Click    #loginbutton

    # ✅ Wait for error message after login attempt
    Wait For Elements State    css=div._9ay7    visible    5s
    ${error}=    Get Text    css=div._9ay7
    Should Contain    ${error}    incorrect

    Close Browser


