*** Settings ***
Resource          ../resources/browser.resource
Suite Setup       Open Browser Session    https://opensource-demo.orangehrmlive.com/
Suite Teardown    Close Browser Session
Test Teardown     Run Keyword If Test Failed    Capture Screenshot    failed_${TEST NAME}

*** Test Cases ***
Login With Valid Credentials
    Wait For Elements State    css=input[name="username"]    visible    timeout=20s
    Fill Text    css=input[name="username"]    Admin
    Fill Text    css=input[name="password"]    admin123
    Click        css=button[type="submit"]

    
    Wait For Elements State    css=h6.oxd-topbar-header-breadcrumb-module    visible    timeout=20s
    Get Text                  css=h6.oxd-topbar-header-breadcrumb-module    ==    Dashboard
    Capture Screenshot     login_success

Logout Successfully
    # If we're already logged in from previous test, open dropdown; otherwise login.
    ${is_login_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State    css=input[name="username"]    visible    timeout=3s
    IF    ${is_login_visible}
        Fill Text    css=input[name="username"]    Admin
        Fill Text    css=input[name="password"]    admin123
        Click        css=button[type="submit"]
        Wait For Elements State    css=h6.oxd-topbar-header-breadcrumb-module    visible    timeout=20s
    END

    Click    css=.oxd-userdropdown-tab
    Wait For Elements State    text=Logout    visible    timeout=10s
    Click    text=Logout

    Wait For Elements State    css=input[name="username"]    visible    timeout=20s
    Capture Screenshot      logout_success