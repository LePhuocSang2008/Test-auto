*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library    random

*** Variables ***
${URL_API_STATE}    http://gw-tms-staging.gonsa.vn/mobile-customer-api/api/v1/gonsa/users/dropdown/states?is_express=0


*** Test Cases ***
Get Random Option From API
    # Thực hiện một yêu cầu GET đến endpoint
    ${response}=    GET    ${URL_API_STATE}    
    Should Be Equal As Numbers    ${response.status_code}    200
    Log To Console    ${response.content}