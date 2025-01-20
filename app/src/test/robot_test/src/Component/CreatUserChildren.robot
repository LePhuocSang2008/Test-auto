*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${URL}    https://express-staging.gonsa.vn/home-page/
${USERNAME}    10034177
${PASSWORD}    Gonsa@123
${CREATE_PASSWORD}    Gonsa@123
${CREATE_PASSWORD_CONFIRM}    Gonsa@123

*** Test Cases ***
Create User Children
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//*[@id="menu"]/div/li[4]
    Input Text    user    ${USERNAME}
    Input Password    pwd    ${PASSWORD}
    Click Element    xpath=//*[@id="checkRe"]
    Click Element    xpath=//*[@id="HeaderLogin"]/button
    Sleep     3s

    #Open dialog create user children
    Click Element    //*[@id="app"]/div/div[3]/div[1]/div/div/ul/li[3]/div/a
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/div[3]/div/div/div[1]/div/div/button

    #Create user  
    FOR  ${index}  IN RANGE    15   22
        ${CREATE_NAME}    Set Variable    Nguyen Van ${index}
        ${CREATE_PHONE}=    General Phone
        ${CREATE_EMAIL}    Set Variable    ${CREATE_PHONE}@gmail.com

        ${dialog_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=popup    timeout=5s
        IF  ${dialog_found}
            Create User Children    name=${CREATE_NAME}    email=${CREATE_EMAIL}    phone=${CREATE_PHONE}    passWord=${CREATE_PASSWORD}    confirmPass=${CREATE_PASSWORD_CONFIRM}
            Sleep    2s
        ELSE
            Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/div[3]/div/div/div[1]/div/div/button
            Create User Children    name=${CREATE_NAME}    email=${CREATE_EMAIL}    phone=${CREATE_PHONE}    passWord=${CREATE_PASSWORD}    confirmPass=${CREATE_PASSWORD_CONFIRM}
            Sleep    2s
        END
    END

    Sleep    10s

*** Keywords ***
Create User Children
    [Arguments]    ${name}    ${email}    ${phone}    ${passWord}    ${confirmPass}
    Input Text    name    ${name}
    Input Text    email    ${email}
    Input Text    phone    ${phone}
    Input Text    password    ${passWord}
    Input Text    confirm_password    ${confirmPass}
    Click Element    xpath=//*[@id="popup"]/div/div[3]/div/button[2]

General Phone
    ${random}=    Evaluate    ''.join(random.choices('1234567', k=8))    modules=random
    ${phone}=    Evaluate    random.choice(['03', '05', '09'])    modules=random
    ${numberPhone}    Set Variable    ${phone}${random}
    Return From Keyword    ${numberPhone}