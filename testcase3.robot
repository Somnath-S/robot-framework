*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://www.facebook.com/login/

*** Test Cases ***
Verify Username And Password Fields
    New Browser    chromium    headless=False
    New Page    ${URL}

    # ✅ Username field (class="inputtext _55r1 inputtext _1kbt inputtext _1kbt")
    Wait For Elements State    css=input.inputtext._55r1._1kbt    visible    5s

    # ✅ Password field (class="_55r1 _1kbt")
    Wait For Elements State    css=input._55r1._1kbt    visible    5s

    Sleep    3s
    Close Browser
