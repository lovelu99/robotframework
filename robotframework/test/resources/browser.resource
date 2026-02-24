*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}        chromium
${HEADLESS}       true
${VIEWPORT_W}     1366
${VIEWPORT_H}     768

*** Keywords ***
Open Browser Session
    [Arguments]    ${url}
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': ${VIEWPORT_W}, 'height': ${VIEWPORT_H}}
    New Page       ${url}

Close Browser Session
    Close Browser

Capture Screenshot
    [Arguments]    ${name}
    Take Screenshot    filename=results/${name}.png
