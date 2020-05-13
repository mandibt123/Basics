*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../keywords/homepage.robot
Resource          ../locators/003.robot
Resource          ../keywords/cartpage003.robot
Resource          ../testdata.robot

*** Variables ***
${empty_cart}     3

*** Test Cases ***
RunIf
    Check Shopping Cart
    For
    Log    Start
    FOR    ${x}    IN RANGE    5    10
        Run Keyword If    '${x}' == '2'    Log    X = 2
    END
    Log    Finish
    Repeat Keyword    5    Log    1

Clear Shopping Cart
    [Tags]    first
    Open Browser    http://demo.nopcommerce.com/    chrome
    Maximize Browser Window
    Delete All Cookies
    Wait Until Element Is Visible    //div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a
    Click Element    //div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a
    sleep    2s
    Wait Until Element Is Visible    //*[@id="Email"]
    Input Text    //*[@id="Email"]    ${email_value}
    input text    //*[@id="Password"]    ${password_value}
    Click Element    //div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/input
    Wait Until Element Is Visible    //div[6]/div[2]/ul[1]/li[2]/a
    SLeep    10
    ${empty_cart}    Run Keyword And Return Status    Element Text SHould Be    //*[@id="topcartlink"]/a/span[2]    (0)
    Run Keyword If    ${empty_cart}==False    Empty Cart
