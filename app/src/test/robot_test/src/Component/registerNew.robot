*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    https://express-staging.gonsa.vn/home-page/
${BROWSER}    Chrome
${name_cp}    NT Minh Khôi TV
${phone}    0944241013
${tax_code}    8015110514
${odr_num}    ODR-2409-00011523
${TIMEOUT}    60
${index}    1


*** Test Cases ***
REGISTER ORDER
    Open Browser    ${URL}    Chrome

    Maximize Browser Window
    Click Element    xpath=//*[@id="menu"]/div/li[3]/a
    Sleep    3s
    Click Element    xpath=//*[@id="menu"]/div/li[3]/div/div[1]/div/div
    Sleep    3s
    Click Element    xpath=//*[@id="HeaderLogin"]/div/div/div[1]/div/select
    Sleep    3s
    Click Element    xpath=//*[@id="HeaderLogin"]/div/div/div[1]/div/select/option[2]
    Sleep    3s
    Input Text    phone    ${phone}    ${TIMEOUT}
    Sleep    3s
    Input Text    odr_num    ${odr_num}    ${TIMEOUT}
    Sleep    3s
    Click Element    xpath=//*[@id="HeaderLogin"]/button
    Sleep    3s
    Click Element    xpath=//*[@id="sendOTP"]/div[1]/div[2]/div/label[2]
    Sleep    3s
    Click Element    xpath=//*[@id="sendOTP"]/div[2]/button[2]
    Sleep    3s
    Repeat Click    xpath=//*[@id="getOTP"]/div[1]/div[3]/div/div[2]/button
    Sleep    3s



*** Keywords ***
Repeat Click
    [Arguments]    ${xpath}
    FOR    ${index}    IN RANGE    5  # Số lần bạn muốn lặp lại
    Click Element    ${xpath}
    Sleep    60s
    END