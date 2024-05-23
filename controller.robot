*** Comments ***

########################################################################################################################################################
# Autor: Jhonattan Gomes
# Descrição: Responsible for reading and executing test cases
########################################################################################################################################################

*** Settings ***

Resource    helpers/dependencies.robot

Test Teardown    Close Browser

*** Variables ***

${COMPONENT}    component
${TAG}           tag
${BROWSER}       browser         

*** Test Cases ***

Test Cases
    Run Tests    ${COMPONENT}    ${TAG}    ${BROWSER}