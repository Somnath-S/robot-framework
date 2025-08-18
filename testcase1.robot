*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://www.facebook.com/login/

*** Test Cases ***
Verify Facebook Login Heading
    New Browser    chromium    headless=False
    New Page    ${URL}
    Wait For Elements State    css=._9axz    visible    5s
    ${heading}=    Get Text    css=._9axz
    Should Be Equal    ${heading}    Log in to Facebook
    Sleep    3s
    Close Browser
