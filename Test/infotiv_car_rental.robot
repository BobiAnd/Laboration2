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

Verify page contains Textfield and button
    Page Should Contain Textfield       //*[@id="name"]  //*[@id="last"]  //*[@id="phone"]
    Page Should Contain Textfield       //*[@id="emailCreate"]  //*[@id="passwordCreate"]
    Page Should Contain Button          //*[@id="createUser"]  //*[@id="continue"]
End Web Test
    Close Browser

*** Test Cases ***

Testar om det finns fält för att skapa ny andvändare
    [Documentation]     kravet är att det finns first och last name phone number och password och att cancel och create button finns

    [Tags]              test 1

    Go To Web Page
    Go to Createuser
    Verify page contains Textfield and button

