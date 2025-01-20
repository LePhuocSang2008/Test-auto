*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${URL}    https://express-staging.gonsa.vn/index
${BROWSER}    Chrome
${USERNAME_SUCCSESS}    10034176
${PASSWORD_SUCCSESS}    Gonsa@123
${USERNAME_FAILED}    10034185
${PASSWORD_FAILED}    Gonsa@123
${TIMEOUT}    10

*** Test Cases ***
TEST LOGIN PASS
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element    xpath=//*[@id="menu"]/div/li[4]/a
    Input Text    NavLoginUserId    ${USERNAME_SUCCSESS}    ${TIMEOUT}
    Input Text    NavLoginPassword    ${PASSWORD_SUCCSESS}    ${TIMEOUT}
    Click Element   //*[@id="HeaderLogin"]/button
    Wait Until Element Is Visible    url=https://express-staging.gonsa.vn/customer/create-shipment
    Click Element    //*[@id="app"]/div/div[3]/div/div[1]/div/div[2]/div[2]/div[2]/div[2]
    Sleep    60s
    Close Browser
