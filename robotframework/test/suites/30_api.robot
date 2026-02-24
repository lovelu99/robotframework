*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Verify API
    Create Session    api    https://jsonplaceholder.typicode.com

    ${response}=    GET On Session    api    /users/1

    Status Should Be    200    ${response}