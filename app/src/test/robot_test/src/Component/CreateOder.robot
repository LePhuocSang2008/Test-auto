*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ScreenCapLibrary
Resource    ../Variables/Login.robot
Resource    ../Variables/CreateOder.robot
Resource    ../Variables/Domain.robot

# *** Test Cases ***
# CREATE ORDER SHIPPING
#     Open Browser    ${URL}    chrome
#     Maximize Browser Window
#     # Start Video Recording    output=recording.mp4
#     LOGIN
#     #Create order
#     Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/div[3]/div[2]/button[1]
    
#     #Random giá trị
#     ${RANDOM_VALUE_SERVICE}=    Evaluate    random.choice(${OPTION_SERVICE})    modules=random
#     ${RANDOM_VALUE_CONDITION}=    Evaluate    random.choice(${OPTION_CONDITION})    modules=random
#     ${RANDOM_VALUE_INVOICE}=    Evaluate    random.choice(${OPTION_INVOICE})    modules=random

#     #Loại dịch vụ
#     Select From List By Value    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[1]/div/div/select    ${RANDOM_VALUE_SERVICE}

#     # Thông tin giao nhận
#     INFOMATION DELIVERY

#     # Thông tin hàng hóa
#     GOODS
    
#     Scroll Automatically    200
#     # Điều kiện bảo quản
#     Condition    ${RANDOM_VALUE_CONDITION}
#     Scroll Automatically    500
#     # Hóa đơn
#     Invoice    Y
#     Scroll Automatically    500
#     Collection COD
#     Scroll Automatically    400
#     Sleep    3s
#     # Stop Video Recording
#     CREATE ORDER

*** Keywords ***
Scroll Automatically
    [Arguments]    ${step}    ${max_scrolls}=1    ${delay}=2
    FOR    ${index}    IN RANGE    ${max_scrolls}
        Execute JavaScript    window.scrollBy(0, ${step})
        # Condition    ${OPTION_CONDITION}
        Sleep    ${delay}
    END

# LOGIN
#     Click Element    xpath=//*[@id="menu"]/div/li[4]
#     Input Text    user    ${USERNAME}
#     Input Password    pwd    ${PASSWORD}
#     Click Element    xpath=//*[@id="checkRe"]
#     Click Element    xpath=//*[@id="HeaderLogin"]/button
#     Sleep     3s

INFOMATION DELIVERY
    # Thông tin lấy hàng
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[2]/div/div[1]/div/div
    Click Element    xpath=//*[@id="popup"]/div/div[2]/img
    Click Element    xpath=//*[@id="popup"]/div/div[2]/div/div/div[2]/table/tbody/tr[1]/td[1]/input
    Click Element    xpath=//*[@id="popup"]/div/div[3]/div/button[2]
    Sleep    3s
    Click Element    xpath=//*[@id="popup"]/div/div[2]/form/div/div[4]/div/button[2]

    # Thông tin giao hàng
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[2]/div/div[2]/div/div
    Click Element    xpath=//*[@id="popup"]/div/div[2]/img
    Click Element    xpath=//*[@id="popup"]/div/div[2]/div/div/div[2]/table/tbody/tr[3]/td[1]/input
    Click Element    xpath=//*[@id="popup"]/div/div[3]/div/button[2]
    Sleep    3s
    Click Element    xpath=//*[@id="popup"]/div/div[2]/form/div/div[4]/div/button[2]

GOODS
    Input Text     xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[2]/div[1]/div/input    ${LENGHT}
    Input Text     xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[2]/div[2]/div/input    ${WIDTH}
    Input Text     xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[2]/div[3]/div/input    ${HEIGHT}
    Input Text     xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[2]/div[4]/div/input    ${QUANTITY}
    Input Text     xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[2]/div[5]/div/input    ${WEIGHT}

Condition
    [Arguments]    ${RANDOM_VALUE_CONDITION}
    Click Element    xpath=//*[@id="vs1__combobox"]
    Click Element    xpath=//*[@id="${RANDOM_VALUE_CONDITION}"]
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[4]/div[2]/div/div/div/input
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[4]/div[3]/div/div/input
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[4]/div[6]/div/label/input
    Choose File    css:input[type="file"]    ${FILE_PATH}
    Input Text    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[4]/div[5]/textarea    note đơn hàng kiện
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[3]/div[4]/div[6]/div/label/input

Invoice
    [Arguments]    ${invoice}
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[4]
    ${invoices}=    Set Variable    ${invoice}
    IF  '${invoices}' == 'Y'
        ${current_value}=    Get Value    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[4]/div/div[5]/div/input
        Run Keyword If    '${current_value}' == ''    Input Text    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[4]/div/div[5]/div/input    ${Email_invoice}
        ${RECIVER_NAME}=    Get Value    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[4]/div/div[1]/input
        ${CHECK_RECIVER_NAME}=    Get Value    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[4]/div/div[6]/div/input
        Run Keyword If    '${CHECK_RECIVER_NAME}' == ''    Input Text    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[4]/div/div[6]/div/input    ${RECIVER_NAME}
        Input Text    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[4]/div/div[7]/textarea    Note hóa đơn  
    END

Collection COD
    ${RANDOM_COD}=    Evaluate    ''.join(random.choices('12345679', k=1))    modules=random
    Click Element    xpath=//*[@id="code"]
    Input Text    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[5]/div/div[1]/div/div/div/input    ${RANDOM_COD}000000

CREATE ORDER
#     # Tạo đơn
    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[6]/div/div/button[2]
    ${btn_create_2}=    Set Variable    xpath=//*[@id="popup"]/div/div[3]/div/button[2]
    Run Keyword If    '${btn_create_2}' == ''    Click Element    xpath=//*[@id="app"]/div/div[3]/div[2]/div/form/div[6]/div/div/button[2]    
    Sleep    3s
#     # Xác nhận tạo đơn
    Click Element    xpath=//*[@id="popup"]/div/div[3]/div/button[2]_