*** Settings ***
Library    Browser

*** Test Cases ***
Verify Username And Password Fields
    New Page    file:///C:/path/to/login.html
    Get Title    ==    Login Page
    Get Text     h2    ==    Login
    Get Attribute    #email    type    ==    email
    Get Attribute    #password    type    ==    password
    Fill Text    #email    test@example.com
    Fill Text    #password    secret123
