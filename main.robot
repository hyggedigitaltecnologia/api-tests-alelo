##################################################################################################################################
# Autor: Jhonattan Gomes
# Decrição: Compilation of project files.
##################################################################################################################################

*** Settings ***

### Bibliotecas

Library     Collections
Library     Process
Library     OperatingSystem 
Library     SeleniumLibrary
Library     String
Library     DateTime
Library     FakerLibrary    locale=pt_BR
Library     BuiltIn
Library     XML
Library     RequestsLibrary

### Bibliotecas personalizadas

Library     libraries/command.py

*** Variables ***

${PROJECT_PATH}             ${CURDIR}

${BASE_URL}    http://jsonplaceholder.typicode.com

${GLOBAL_RESPONSE}

${GLOBAL_STATUS_CODE}

${GLOBAL_CONTENT}

&{BROWSER}     CHROME=chrome
...            CHROMEHEADLESS=headlesschrome
...            EDGE=edge
...            EDGEHEADLESS=headlessedge
...            FIREFOX=firefox
...            FIREFOXHEADLESS=headlessfirefox