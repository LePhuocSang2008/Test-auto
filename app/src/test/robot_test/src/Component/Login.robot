*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables/Login.robot
Resource    ../Variables/Domain.robot

*** Keywords ***
Login
    [Arguments]    ${userName}    ${passWord}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//*[@id="menu"]/div/li[4]
    Input Text    user    ${userName}
    Input Password    pwd    ${Password}
    Click Element    xpath=//*[@id="checkRe"]
    Click Element    xpath=//*[@id="HeaderLogin"]/button