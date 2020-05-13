*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Open Browser
    Open application
    navigate to login page

Variables
    Log    &{creds}[email]
    Log    &{creds}[pass]
    Log    ${email}
    Log    ${pass}

*** Keywords ***
Open application
    Open Browser    http://automationpractice.com    chrome
    Wait Until Location Is    http://automationpractice.com
    Maximize Browser Window

navigate to login page
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[2]/a
    Wait Until Element Is Visible    id:email_create    10s    Email field not visible
    Input Text    id:email_create    stefasssn@test.com
    Click Element    ${CreateAccountButton}
    Wait Until Element Is Visible    //*[@id="customer_firstname"]    10s
    Input Text    //*[@id="customer_firstname"]    Stefan
    Input Text    //*[@id="customer_lastname"]    Mandovski
    Input Text    //*[@id="passwd"]    pa55word
    Input Text    //*[@id="firstname"]    Stefan
    Input Text    //*[@id="lastname"]    Mandovski
    Input Text    //*[@id="address1"]    Bitola 1
    Input Text    //*[@id="city"]    Bitola
    Select From List By Value    //*[@id="id_state"]    5
    Input Text    //*[@id="postcode"]    92127
    Input Text    //*[@id="phone_mobile"]    8882342344
    Input Text    //*[@id="alias"]    Doma
    SLeep    15s
    Click Element    //*[@id="submitAccount"]/span
    Wait Until Page Contains    Stefan Mandovski
    Mouse Over    //*[@id="submitAccount"]/span
