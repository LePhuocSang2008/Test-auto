*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables/Domain.robot
Resource    ../Variables/Login.robot
Resource    ../Component/Login.robot



*** Test Cases ***
Login failed due to missing username or password
    Login    userName=    passWord=

Login failed due to missing username
    Login    userName=    passWord=${Password}

Login failed due to missing password
    Login    userName=${UserName}    passWord=

Login successfull
    Login    userName=${UserName}    passWord=${Password}