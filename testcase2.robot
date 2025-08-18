*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://www.facebook.com/login/

*** Test Cases ***
Open And Maximize Browser
    New Browser    chromium    headless=False
    New Page    ${URL}
     Set Viewport Size    1920    1080
     close Browser