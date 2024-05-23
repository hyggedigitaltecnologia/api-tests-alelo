*** Comments ***

##################################################################################################################################
# Author: Jhonattan Gomes
# Description: Tests regarding the my account component
##################################################################################################################################

*** Settings ***

Resource    ../../../../helpers/dependencies.robot

*** Test Cases ***

Scenario - Validation of Status Code 200
    [Tags]    validation_of_status_code_200    api

    GIVEN That i make a GET request to "/users"
    THEN The status code must be "${GLOBAL_STATUS_CODE}"

Scenario: JSON Structure Validation
    [Tags]    json_structure_validation    api

    GIVEN That i make a GET request to "/users"
    THEN I validate the json structure correctly

Scenario: Validation of Specific Values for a User
    [Tags]    validation_of_specific_values_for_a_user    api

    GIVEN That i make a GET request to "/users"
    THEN The first user must have name as Leanne Graham

Scenario: List Size Validation
    [Tags]    list_size_validation    api

    GIVEN That i make a GET request to "/users"
    THEN The user list must contain 10 users
