*** Settings ***
Library    SeleniumLibrary
Resource    ../Component/CreateOder.robot
Resource    ../Variables/Login.robot
Resource    ../Component/Login.robot


*** Test Cases ***
Create Order Service
    Login    userName=${UserName}    passWord=${Password}
    #Create order
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/div[3]/div[2]/button[1]
        #Random giá trị
    ${RANDOM_VALUE_SERVICE}=    Evaluate    random.choice(${OPTION_SERVICE})    modules=random
    ${RANDOM_VALUE_CONDITION}=    Evaluate    random.choice(${OPTION_CONDITION})    modules=random
    ${RANDOM_VALUE_INVOICE}=    Evaluate    random.choice(${OPTION_INVOICE})    modules=random

    #Loại dịch vụ
    Select From List By Value    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[1]/div/div/select    ${RANDOM_VALUE_SERVICE}

    # Thông tin giao nhận
    INFOMATION DELIVERY