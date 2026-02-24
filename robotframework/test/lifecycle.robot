*** Settings ***
Library    Browser

*** Test Cases ***
Open Google
    New Browser    chromium    headless=True
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       https://www.google.com
    Get Title      ==    Google
    Close Browser
