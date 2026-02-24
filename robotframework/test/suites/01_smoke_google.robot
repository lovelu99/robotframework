*** Settings ***
Resource    ../resources/browser.resource
Suite Setup     Open Browser Session    https://www.google.com
Suite Teardown  Close Browser Session

*** Test Cases ***
Google Homepage Loads
    ${title}=    Get Title
    Should Contain    ${title}    Google
    Capture Screenshot    google_home