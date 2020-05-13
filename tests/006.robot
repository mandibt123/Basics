*** Settings ***
Test Setup        Open and maximize browser
Test Teardown     Close Browser
Test Template     Login with invalid credentials
Library           SeleniumLibrary
Library           ExcelRobot

*** VAriables ***
${email_input}    //*[@id="Email"]
${input_pass}     //*[@id="Password"]
${confirm_pass}    //*[@id="ConfirmPassword"]
${finish_registration}    //*[@id="register-button"]
${login_buton}    //div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a
${finish_login}    //div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/input
${baseurl}        http://demo.nopcommerce.com/
${browser}        chrome
${email1}         stefan@test.com
${pass1}          pass
${valid_username}    stefan@test.com
${valid_password}    password

*** Test Cases ***
Read
    ExcelRobot.Open Excel    ${EXECDIR}\\Book1.xlsx
    ${CC}    Get Column Count    Sheet1
    ${RC}    Get Row Count    Sheet1
    FOR    ${i}    IN RANGE    1    ${CC}+1
        ${cell_valueA}    Read Cell Data By Name    Sheet1    A${i}
        ${cell_valueB}    Read Cell Data By Name    Sheet1    B${i}
        Log    A:${cell_valueA}, B:${cell_valueB}
    END

Write
    [Setup]    Open Browser
    Open Excel To Write    ${EXECDIR}\\Book1.xlsx
    #${RC}    Get Row Count    Sheet1
    FOR    ${i}    IN RANGE    1    5
        Write To Cell by Name    Sheet1    A${i}    aaaa${i}
        Write To Cell by Name    Sheet1    B${i}    bbb${i}
    END
    Save Excel

Login
    [Template]
    Login With Valid Credentials    ${valid_username}    ${valid_password}

LoginTemplate
    [Setup]    Open and maximize browser
    asdasd    asdasd
    stefan@test.com    ${EMPTY}
    ${EMPTY}    pass
    [Teardown]    Close Browser

*** Keywords ***
Open and maximize browser
    open browser    ${baseurl}    ${browser}
    Maximize Browser Window

Login with invalid credentials
    [Arguments]    ${email_arg}    ${pass_arg}
    Wait Until Element Is Visible    ${login_buton}
    Click Element    ${login_buton}
    Wait Until Element Is Visible    ${email_input}
    input text    ${email_input}    ${email_arg}
    Input Text    ${input_pass}    ${pass_arg}
    Click Element    ${finish_login}
    ${invalid_mail_error}    Run Keyword And Return Status    Element Should Be visible    //*[@id="Email-error"]
    Run Keyword If    ${invalid_mail_error}==False    Wait Until Element Contains    //div[contains(@class,'validation-summary-errors')]    Login was unsuccessful

Read Credentials
    ExcelRobot.Open Excel    ${EXECDIR}\\Book1.xlsx
    ${RC}    Get Row Count    Sheet1
    FOR    ${i}    IN RANGE    1    ${RC}+1
        ${username}    Read Cell Data By Name    Sheet1    A${i}
        ${password}    Read Cell Data By Name    Sheet1    B${i}
        Wait Until Element Is Visible    ${login_buton}
        Click Element    ${login_buton}
        Wait Until Element Is Visible    ${email_input}
        input text    ${email_input}    ${username}
        Input Text    ${input_pass}    ${password}
        Click Element    ${finish_login}
        Wait Until Element Contains    //div[contains(@class,'validation-summary-errors')]    Login was unsuccessful
    END

Login With Valid Credentials
    [Arguments]    ${email_arg}    ${pass_arg}
    Wait Until Element Is Visible    ${login_buton}
    Click Element    ${login_buton}
    Wait Until Element Is Visible    ${email_input}
    input text    ${email_input}    ${email_arg}
    Input Text    ${input_pass}    ${pass_arg}
    Click Element    ${finish_login}
