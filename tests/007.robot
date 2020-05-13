*** Settings ***
Test Setup        Log    Test Setup
Library           SeleniumLibrary
Library           String
Library           Collections
Library           ../keywords/ExampleLibrary.py

*** Test Cases ***
ExternalKeywords
    [Tags]    second
    Say Hello
    Sumof N    5

Checkbox
    Open Browser    https://the-internet.herokuapp.com/checkboxes    chrome
    Sleep    5s
    Select Checkbox    //*[@id="checkboxes"]/input[1]
    Sleep    5s
    Unselect Checkbox    //*[@id="checkboxes"]/input[1]
    Sleep    5s
    Close browser

Alerts
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts    chrome
    Sleep    2
    Click Element    //*[@id="content"]/div/ul/li[3]/button
    Sleep    2
    Input Text Into Alert    Test    ACCEPT

Upload
    Open Browser    https://the-internet.herokuapp.com/upload    chrome
    Wait Until Element Is Visible    //*[@id="file-upload"]
    Input Text    //*[@id="file-upload"]    ${EXECDIR}\\testdata.robot
    Sleep    10s
    Click Element    //*[@id="file-submit"]

Frames
    Open Browser    https://the-internet.herokuapp.com/nested_frames    chrome
    Sleep    2s
    Select Frame    //frame[@name="frame-top"]
    SLeep    2s
    Select Frame    //frame[@name="frame-middle"]
    Wait Until Element Is Visible    //*[@id="content"]    10s
    Unselect Frame

Tabs
    Open Browser    https://the-internet.herokuapp.com/windows    chrome
    Click Element    //*[@id="content"]/div/a
    Sleep    2s
    ${handles}    Get Window Handles
    ${ids}    Get Window Identifiers
    ${names}    Get Window Names
    ${titles}    Get Window Titles
    Log    ${handles}
    Log    ${ids}
    Log    ${names}
    Log    ${titles}

Tabs2
    Open Browser    https://the-internet.herokuapp.com/windows    chrome
    Sleep    2
    ${handles}    Get Window Handles
    Log    ${handles}
    Click Element    //*[@id="content"]/div/a
    Sleep    2s
    ${handles2}    Get Window Handles
    Log    ${handles2}
    Switch Window    NEW
    Sleep    2s
    Element Text Should Be    //div[1]/h3    New Window
    Switch Window    MAIN
    Element Text Should Be    //div[1]/h3    Opening a new window
