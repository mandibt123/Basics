*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://automationpractice.com
${browser}        chrome
@{credentials}    stefan@gmail.com    password    asdsaad    adsdasd    dasdsasad    \    \    \    \    \    a2
&{creds}          email=stefan@gmail.com    pass=lozinka
${email}          stefan@gmail.com
${pass}           lozinka
${CreateAccountButton}    //*[@id="SubmitCreate"]/span