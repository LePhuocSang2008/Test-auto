*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary


*** Variables ***
${URL_API_STATE}    http://gw-tms-staging.gonsa.vn/mobile-customer-api/api/v1/gonsa/users/dropdown/states?is_express=0
${URL}    https://express-staging.gonsa.vn/index
${BROWSER}    Chrome
${NAME_CP}    NT Minh Khôi TV
${PHONE}    0944241013
${TAX_CODE}    8015110514
${ODR_NUM}    ODR-2409-00011523
${TIMEOUT}    60
${index}    1


#register new
${FULL_NAME}
${EMAIL}
${DATE}    10/10/2024


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
    Input Text    phone    ${PHONE}    ${TIMEOUT}
    Sleep    3s
    Input Text    odr_num    ${ODR_NUM}    ${TIMEOUT}
    Sleep    3s
    Click Element    xpath=//*[@id="HeaderLogin"]/button
    Sleep    3s
    Click Element    xpath=//*[@id="sendOTP"]/div[1]/div[2]/div/label[2]
    Sleep    3s
    Click Element    xpath=//*[@id="sendOTP"]/div[2]/button[2]
    Sleep    3s
    Repeat Click    xpath=//*[@id="getOTP"]/div[1]/div[3]/div/div[2]/button
    Sleep    3s

    Click Element    xpath=//*[@id="getOTP"]/div[1]/div[3]/div/div[2]/button

    Close Browser


REGISTER CUSTOMER
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element    xpath=//*[@id="menu"]/div/li[3]/a
    Click Element    xpath=//*[@id="menu"]/div/li[3]/div/div[1]/div/div
    Click Element    xpath=//*[@id="HeaderLogin"]/div/div/div[1]/div/select
    Click Element    xpath=//*[@id="HeaderLogin"]/div/div/div[1]/div/select/option[1]
    Input Text    name_cp    ${NAME_CP}    ${TIMEOUT}
    Input Text    phone    ${phone}    ${TIMEOUT}
    Input Text    tax_code    ${TAX_CODE}    ${TIMEOUT}
    Click Element   //*[@id="HeaderLogin"]/button
    Wait Until Element Is Visible    url=https://express-staging.gonsa.vn/customer/create-shipment
    Click Element    //*[@id="app"]/div/div[3]/div/div[1]/div/div[2]/div[2]/div[2]/div[2]
    Sleep    10s
    Close Browser


Register New
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element    xpath=//*[@id="menu"]/div/li[3]/a
    Sleep    5s
    Click Element    xpath=//*[@id="menu"]/div/li[3]/div/div[2]/div/div
    Sleep    3s
    # Click Element    xpath=//*[@id="form"]/div[1]/div/div[2]/i
    # Sleep    3s
    Click Element    xpath=//*[@id="HeaderLogin"]/div[2]/div/div[1]/div/select/option[2]
    Sleep    3s
    Input Text    date    ${DATE}
    Sleep    3s
    # Close Browser


*** Keywords ***
Repeat Click
    [Arguments]    ${xpath}
    FOR    ${index}    IN RANGE    5  # Số lần bạn muốn lặp lại
    Click Element    ${xpath}
    Sleep    60s
    END