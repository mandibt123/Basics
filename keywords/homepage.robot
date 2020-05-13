*** Settings ***
Library           SeleniumLibrary
Library           String

*** Keywords ***
Check Shopping Cart
    Run Keyword If    '${var}' == '1'    Clear Cart    var = 1
    Run Keyword If    '${var}' == '0'    Log    Ova ne e tocno

Empty Cart
    ${itemsInCart}    Get Element Count    //*[@name="removefromcart"]
    Click Element    //*[@id="topcartlink"]/a/span[2]
    Sleep    10
    FOR    ${x}    IN RANGE    1    ${removebrackets}+1
        Click Element    (//*[@name="removefromcart"])[${x}]
    END
    Sleep    10
    Click Element    //*[@id="shopping-cart-form"]/div[2]/div[1]/input[1]
    [Return]    ${itemsInCart}
