*** Settings ***
Library    Browser

*** Test Cases ***
Verify Username And Password Fields
    New Page    https://www.facebook.com/login/    wait_until=load
    Wait For Elements State    input[name="email"]    visible    timeout=20s
    Wait For Elements State    input[name="pass"]     visible    timeout=20s
    Get Title    contains    Facebook
    Get Attribute    input[name="email"]    name    ==    email
    Get Attribute    input[name="pass"]    name    ==    pass
    Fill Text    input[name="email"]    test@example.com
    Fill Text    input[name="pass"]    secret123
*** Settings ***
Library    Browser

*** Test Cases ***
Verify Username And Password Fields
    New Page    https://www.facebook.com/login/    wait_until=load
    Wait For Elements State    input[name="email"]    visible    timeout=20s
    Wait For Elements State    input[name="pass"]     visible    timeout=20s
    Get Title    contains    Facebook
    Get Attribute    input[name="email"]    name    ==    email
    Get Attribute    input[name="pass"]    name    ==    pass
    Fill Text    input[name="email"]    test@example.com
    Fill Text    input[name="pass"]    secret123
