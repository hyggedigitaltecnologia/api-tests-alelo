*** Comments ***

##################################################################################################################################
# Autor: Jhonattan Gomes
# Decrição: Console and report logs
##################################################################################################################################

*** Settings ***

Resource    ../main.robot

*** Keywords ***

Log Console And Report
    [Documentation]    Cria log no console e report
    [Arguments]    ${msg}
    Log    ${msg}
    Log To Console    ${msg}

Passed Log
    [Documentation]    Loga passed no report
    [Arguments]    ${msg}
    Log Console And Report    ${msg}

Failure Log
    [Documentation]    Loga fail no report
    [Arguments]    ${msg}
    Run Keyword And Continue On Failure    Fail    ${msg}