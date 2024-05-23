*** Comments ***

##################################################################################################################################
# Author: Jhonattan Gomes
# Description: Keywords referring to the api component
##################################################################################################################################

*** Settings ***

Resource    ../../../helpers/dependencies.robot    # Importação do arquivo dependencies.robot que contém todas as Keywords necessárias para o nosso teste.

*** Keywords ***

Validate Status Code
    [Arguments]    ${RESPONSE}

    ${STATUS_200}    Run Keyword And Return Status    
    ...              Should Be Equal As Strings    ${RESPONSE.status_code}    200

    ${STATUS_201}    Run Keyword And Return Status    
    ...              Should Be Equal As Strings    ${RESPONSE.status_code}    201

    ${STATUS_204}    Run Keyword And Return Status    
    ...              Should Be Equal As Strings    ${RESPONSE.status_code}    204

    Run Keyword If    '${STATUS_200}'!='True' 
    ...               and '${STATUS_201}'!='True' 
    ...               and '${STATUS_204}'!='True'    
    ...               Fail    Erro na requisição! Verifique: ${RESPONSE.status_code}

Create New Session

    ${headers}    Create Dictionary
    ...           User-Agent=PostmanRuntime/7.36.1
    ...           Accept=*/*
    ...           Accept-Encoding=gzip, deflate, br
    ...           Connection=keep-alive
    ...           Content-Type=application/json

    Create Session    alias=jsonplaceholder
    ...               url=${BASE_URL}
    ...               headers=${headers}
    ...               disable_warnings=True

That i make a GET request to "${path}"
    
    Create New Session

    ${RESPONSE}           GET On Session
    ...                   alias=jsonplaceholder
    ...                   url=${BASE_URL}${path}

    Log                   ${RESPONSE.status_code}
    Validate Status Code    ${RESPONSE}

    Set Global Variable    ${GLOBAL_STATUS_CODE}    ${RESPONSE.status_code}
    Set Global Variable    ${GLOBAL_CONTENT}    ${RESPONSE.json()}

The status code must be "${status}"

    ${STATUS_200}    Run Keyword And Return Status    
    ...              Should Be Equal As Strings    ${status}    200

    ${STATUS_201}    Run Keyword And Return Status    
    ...              Should Be Equal As Strings    ${status}    201

    ${STATUS_204}    Run Keyword And Return Status    
    ...              Should Be Equal As Strings    ${status}    204

    Run Keyword If    '${STATUS_200}'!='True' 
    ...               and '${STATUS_201}'!='True' 
    ...               and '${STATUS_204}'!='True'    
    ...               Fail    Erro na requisição! Verifique: ${status}
    
    Passed Log    ${\n}Status Code validated successfully

I validate the json structure correctly

    Length Should Be   ${GLOBAL_CONTENT}    10

    FOR    ${user}    IN    @{GLOBAL_CONTENT}
        Dictionary Should Contain Key    ${user}    id
        Dictionary Should Contain Key    ${user}    name
        Dictionary Should Contain Key    ${user}    username
        Dictionary Should Contain Key    ${user}    email
        Dictionary Should Contain Key    ${user}    address
        Dictionary Should Contain Key    ${user}    phone
        Dictionary Should Contain Key    ${user}    website
        Dictionary Should Contain Key    ${user}    company
    END

    Passed Log    ${\n}The json structure is correct

The first user must have name as Leanne Graham
    
    ${first_user}      Get From List       ${GLOBAL_CONTENT}    0
    ${first_user}      Get From Dictionary       ${first_user}    name
    Should Be Equal    ${first_user}  Leanne Graham

    Passed Log    ${\n}The first user is called Leanne Graham

The user list must contain 10 users
    
    Length Should Be   ${GLOBAL_CONTENT}    10

    Passed Log    ${\n}The list contains 10 users
