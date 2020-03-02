*** Settings ***

Documentation       Labb3
Library             SeleniumLibrary
Library             DateTime
Resource            ../Resources/Keywords.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test





*** Test Cases ***

Testar om det finns fält och knappar för att skapa ny andvändare.
    [Documentation]    On the create user page, the user may create a user account
  ...                  Required fields are, first and last name, phone number, email and password.
  ...                  A Cancel button and a Create button

    [Tags]              Test 1

   Given User goes To Web Page
   And User clicks on CreateUser button
   When Page create user has loaded
   Then Verify page contains Textfield and button

Testar om det Canecel knappen när man skapar användare funkar
    [Documentation]    A Cancel button, that will take the user to the date selection page,

    [Tags]              Test 2

    User goes To Web Page
    User clicks on CreateUser Button
    verify cancel button goes to date saite


Testar att skapa en användare med den informationen man matar in
    [Documentation]     Create button that will attempt to create the user account with the inputted information.

    [Tags]              Test 3

   Given User goes To Web Page
    When User clicks on CreateUser Button
    Then User tryes to create user


Testar om Header finns på varje sida
    [Documentation]     The header is available on every page.

    [Tags]              Test 4

   User goes To Web Page
   Verify Header
    User loggs in to my page
   Verify Header
   Load About page
   Verify Header
   Load Continue page
   Verify Header
   Load registration page
   Verify Header

Testar alla headers om man kommer tillbaka till första sidan
    [Documentation]     The logo and title are clickable and will take you to the start page

    [Tags]              Test 5

   User goes To Web Page
   Press logo
   Start page Loaded
    User loggs in to my page
   Press logo
  Start page Loaded
   Load About page
   Press logo
  Start page Loaded
   Load Continue page
   Press logo
   Start page Loaded
   Load registration page
   Press logo
   Start page Loaded

Testar att logga in med ogitlig data och få ett felmedelande
    [Documentation]         If the user inserts the wrong information a error message appears to the left of the buttons.

    [Tags]              Test 6

   User goes To Web Page
   Logg in to my pagen with invalid name
   User Clears login field
   Logg in to my pagen with invalid password

Testar att boka en bil och sedan nollställa värdena
    [Documentation]    On the date selection page, user is required to input start and end dates for the trip.
     ...               The default values will always be put as todays date.
     ...               If the user is signed in then the book button will select the car model on the corresponding row
     ...               and take the user to the confirm booking page.
     ...               On the booking confirmation page,
     ...               the selections made by the user will be displayed along with a basic form that asks for credit card info.
     ...               this form saves nothing and sends no info, it asks for a 16 digit card number, expiration date and cvc code.
     ...                Confirm button that will attempt to finalize the booking.
     ...                On the successful booking page, a message will appear with details of the registered booking if successful.
     ...                A Home button, that will take the user to the date selection page,
     ...                and a My Page button that will take the user to the page where they can view their bookings.
     ...                On a successful booking, an entry is added to the database table bookings with license number of the selected car,
     ...                the selected start/end dates and the users internal id.
     ...                Next to the orders there's a button for unbooking the car which will give the user a warning/confirmation box,
     ...                asking if they really do want to cancel the order.
    [Tags]              Test 7

   User goes To Web Page
   User loggs in to my page
   Controll kalender defultvalue
   Book date
   Select passegers amount
   Check Creditcard field
   Insert Creditcard info
   Confirm creditcard input
   Chek if car is on myPage
   Delete Bokings

Testar om inogningen hoppar vid minskning av skärm
    [Documentation]     To the right is the user information field. If not signed in, a input field for email and password is visible

        [Tags]              Test 8
     User goes To Web Page
     Maximize Browser Window
     Logg in to my pagen with invalid name
     User captures faild login messege no bug screenshot
     Start page Loaded
     Minimaiaz browser to show first bug
     Logg in to my pagen with invalid name
     User captures faild login messege with first bug screenshot
     Start page Loaded
     Minimaiz browser to show second bug
    User captures centerd login bug screenshot
Testar om vid inlogningen om andvändar namnet kommer synas
    [Documentation]     If user signs in successfully, the user information field will change to view a welcome phrase
     ...                with the users firstname.

    [Tags]              Test 9 VG delen

    Given User goes To Web Page
    When User loggs in to my page
    Then User name is shown when logged in

Testar om man logout knappen funkar
    [Documentation]     Buttons will be changed to Logout, that wiill logout the user from the session,
     [Tags]              Test 10 VG delen

    Given User goes To Web Page
    And User loggs in to my page
    when User clicks on logout
    Then Start page loaded
