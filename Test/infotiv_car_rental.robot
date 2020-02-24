*** Settings ***

Documentation       Labb3
Library         SeleniumLibrary
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Keywords ***
Begin Web Test
    Open Browser        about:blank  Chrome

Go To Web Page
    Load Page
   Verify Page Loaded

Load Page
    Go To               http://rental18.infotiv.net/webpage/html/gui/index.php

Verify Page Loaded
   Wait Until Page Contains        Infotiv Car Rental

Go to Createuser
    Click Button                   //*[@id="createUser"]
    Verify Search Completed
Verify Search Completed
    Wait Until Page Contains        Create a new user


End Web Test
    Close Browser

*** Test Cases ***

Testar att komma till websidan
    [Documentation]     Testar att komma in på websidan infotiv car rental
    [Tags]              test 1

    Go To Web Page
    Go to Createuser