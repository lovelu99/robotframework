*** Settings ***
Resource    ../resources/browser.resource
Suite Setup     Open Browser Session    https://example.com
Suite Teardown  Close Browser Session

*** Test Cases ***
Example Domain Has Expected Title And Text
    Get Title    ==    Example Domain
    Get Text     h1    ==    Example Domain
    Capture Screenshot    example_domain