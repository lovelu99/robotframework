*** Settings ***
Resource    ../resources/browser.resource

*** Test Cases ***
Navigate Between Pages
    Open Browser Session    https://example.com
    Capture Screenshot    nav_01_example

    Go To    https://www.wikipedia.org
    Wait For Elements State    css=input#searchInput    visible    timeout=10s
    Capture Screenshot    nav_02_wikipedia

    Close Browser Session