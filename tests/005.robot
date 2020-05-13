*** Settings ***
Test Setup        Log    Test Setup
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String

*** Test Cases ***
Keywords
    [Tags]    second
    [Setup]    Log       Test Start
    Log    Helloa
    Log    ${itemsInCart}
    [Teardown]    Log    Test Finish

TestSetup
    [Setup]    Open Browser    browser=chrome
    Go to    http://www.google.com
    Title Should Be    Google
    [Teardown]    Close Browser
