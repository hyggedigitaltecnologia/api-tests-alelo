##################################################################################################################################
# Autor: Jhonattan Gomes
# Decrição: Calls from all dependencies.
##################################################################################################################################

*** Settings ***

Resource    ../main.robot

### Helpers ###

Resource    log.robot
Resource    custom_keywords.robot

### Components ###

Resource    ../components/api/api_get/tests/api_get_tests.robot

### Keywords ###

Resource    ../keywords/api_keywords/api_get_keywords/api_get_keywords.robot

*** Variables ***

${filled_file}              false
${screenshot_path}          false
${time_out_element}         60

*** Keywords ***

New Data
    [Documentation]    Criação dos dados novos

    ${new_name}            FakerLibrary.First Name
    ${new_last_name}       FakerLibrary.Last Name
    ${new_user}            FakerLibrary.User Name
    ${new_email}           FakerLibrary.Email
    ${new_password}        FakerLibrary.Password
    ${new_ctt}             FakerLibrary.Phone Number
    ${new_address}         FakerLibrary.Address
    ${new_number}          FakerLibrary.Building Number
    ${new_add}             FakerLibrary.Address
    ${new_neighborhood}    FakerLibrary.Name
    ${new_city}            FakerLibrary.City
    ${new_state}           FakerLibrary.City
    ${new_country}         FakerLibrary.Country
    ${new_date}            FakerLibrary.Date Time This Month

    &{new}     Create Dictionary 
    ...        new_name=${new_name}
    ...        las_tname=${new_last_name}
    ...        new_user=${new_user}
    ...        new_email=${new_email}
    ...        new_password=${new_password}
    ...        confirm_new_password=${new_password}
    ...        ctt=${new_ctt}
    ...        address=${new_address}
    ...        number=${new_number}
    ...        complement=${new_neighborhood}
    ...        neighborhood=${new_neighborhood}
    ...        city=${new_city}
    ...        state=${new_state}
    ...        country=${new_country}
    ...        date_time=${new_date}

    RETURN    ${new}

Run Tests
    [Documentation]    Manages the execution of automated tests
    [Arguments]    ${component}    ${tag}    ${browser}

    ${date}    Get Current Date    result_format=%d%m%Y%H%M%S
    ${cmd}    Set Variable    robot --listener allure_robotframework -i ${tag} -d ./results -x output-xunit.xml --variable BROWSER:${browser} components/${component}
    Run Command Lines    ${cmd}