*** Settings ***

Documentation       Labb3
Library         SeleniumLibrary
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Keywords ***
Begin Web Test
    Open Browser        about:blank  Chrome

Go To Web Page
    Load main Page
   Verify Page Loaded

Load main Page
    Go To               http://rental18.infotiv.net/webpage/html/gui/index.php
Load my home Page
   Logg in to my page
Load About page
    Go To               http://rental18.infotiv.net/webpage/html/gui/about.php
Load Continue page
    Go To               http://rental18.infotiv.net/webpage/html/gui/showCars.php
Load registration page
    Go To               http://rental18.infotiv.net/webpage/html/gui/userRegistration.php

Verify Page Loaded
   Wait Until Page Contains        When do you want to make your trip?

Go to Createuser
    Click Button                   //*[@id="createUser"]
    Verify Search Completed
Verify Search Completed
    Wait Until Page Contains        Create a new user

Verify page contains Textfield and button
    Page Should Contain Textfield       //*[@id="name"]  //*[@id="last"]  //*[@id="phone"]
    Page Should Contain Textfield       //*[@id="emailCreate"]  //*[@id="passwordCreate"]
    Page Should Contain Button          //*[@id="createUser"]  //*[@id="continue"]

Verify Cancel button goes to date saite
    Click Button                            //*[@id="cancel"]
    Location Should Be                      http://rental18.infotiv.net/webpage/html/gui/index.php

Verify Create button tryes to create user with data
    Input Text                         //*[@id="name"]       Bobi
    Input Text                         //*[@id="last"]       Andreevski
    Input Text                         //*[@id="phone"]       0769478222
    Input Text                         //*[@id="emailCreate"]        bob.andreevski@gmail.com
    Input Text                         //*[@id="confirmEmail"]          bob.andreevski@gmail.com
    Input Text                         //*[@id="passwordCreate"]        ithögskolan
    Input Text                         //*[@id="confirmPassword"]       ithögskolan
     Click Element                     xpath://*[@id="create"]
     Wait Until Page Contains     That E-mail is already taken
Go to first page

Go true all pages
    Click Element               //*[@id="about"]
    Verify Header

Verify Header
    Page Should Contain Element         xpath://*[@id="rightHeader"]
Press logo
    Click Element                       xpath://*[@id="title"]


Logg in to my page
    Input Text          //*[@id="email"]            bob.andreevski@gmail.com
    Input Text          //*[@id="password"]         ithögskolan
    Click Button        //*[@id="login"]
    Wait Until Page Contains        Logout
End Web Test
    Close Browser

*** Test Cases ***

Testar om det finns fält för att skapa ny andvändare
    [Documentation]     kravet är att det finns first och last name phone number och password och att cancel och create button finns

    [Tags]              test 1

    Go To Web Page
    Go to Createuser
    Verify page contains Textfield and button

Testar om det Canecel knappen funkar
    [Documentation]     kravet skall Cancel knappen ta mig till välj datum sidan

    [Tags]              test2

    Go To Web Page
    Go to Createuser
    verify cancel button goes to date saite


Testar om create knappen funkar
    [Documentation]     kravet skall Create knappen försöka skapa en andvändare med dem värdena som fylls i

    [Tags]              test3

    Go To Web Page
    Go to Createuser
    Verify Create button tryes to create user with data


Testar om Header finns på varje sida
    [Documentation]     kravet skall Headernm vara synlig på alla sidor.

    [Tags]              test4

   Go To Web Page
   Verify Header
   Load my home Page
   Verify Header
   Load About page
   Verify Header
   Load Continue page
   Verify Header
   Load registration page
   Verify Header

Testar alla headers om man kommer tillbaka till första sidan
    [Documentation]     kravet skall genom att klicka på Headernm komma tillbaka till första sidan.

    [Tags]              test5

   Go To Web Page
   Press logo
   Verify Page Loaded
   Load my home Page
   Press logo
   Verify Page Loaded
   Load About page
   Press logo
   Verify Page Loaded
   Load Continue page
   Press logo
   Verify Page Loaded
   Load registration page
   Press logo
   Verify Page Loaded



    [Documentation]     kravet skall genom att klicka på Headernm komma tillbaka till första sidan.

    [Tags]              test5

   Go To Web Page