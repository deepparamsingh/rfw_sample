*** Settings ***
Documentation   Contains all keyword of  team member page
Library         SeleniumLibrary
Library         ExcelLibrary
Library         String
Library         Collections
Library         BuiltIn
Library         random
Library         DateTime
Library         OperatingSystem
Resource        ../Pages/Generic.robot
Resource        ../Pages/DashboardPage.robot
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/RegisterMember.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/ReplaceDomainAPI.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/RegisterUserPage.robot
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot

*** Variables ***
${TMFname}     css:#FirstName
${TMLname}     css:#LastName
${TMBusinessEmail}     css:#Email
${TMDepartmentName}     css:.qa-DepartmentId input

${TMLocation}     css:.qa-LocationTypeId input

${TMRole}     css:.qa-member-role input


${teamMember_Action_btn}     css:#Team-Member-Actions
${name_SearchBar}        //input[@placeholder='Search by Name']
${Dept_SearchBar}       //input[@placeholder='Search by Department Name']
${three_dots}       css:.three-dots


*** Keywords ***
Click on add team member action button
    wait until element is visible      ${teamMember_Action_btn}      60
    wait until element is enabled      ${teamMember_Action_btn}      60
    click element      ${teamMember_Action_btn}

Select option from team member action menu
    wait until element is visible      //a[normalize-space()='Add Member']      60
    wait until element is enabled      //a[normalize-space()='Add Member']      60
    click element      //a[normalize-space()='Add Member']

Choose option after clicking on Action button
    [Arguments]    ${option}
    wait until element is enabled       //a[@title='${option}']
    wait until element is visible       //a[@title='${option}']
    click element       //a[@title='${option}']

Enter team member first name
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMFname}=    Catenate    TMFname_${random_string}
    wait until element is visible       ${TMFname}     60
    input text   ${TMFname}    ${generated_TMFname}
    log to console      ${generated_TMFname}
    set global variable       ${generated_TMFname}

Enter team member last name
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMLname}=    Catenate    TMLast_${random_string}
    wait until element is visible       ${TMLname}    60
    input text   ${TMLname}   ${generated_TMLname}
    log to console      ${generated_TMLname}


Enter team member business email
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@yopmail.net
    wait until element is visible       ${TMBusinessEmail}    60
    input text   ${TMBusinessEmail}   ${generated_TMbusinessEmail}
    log to console      ${generated_TMbusinessEmail}

Enter team member business email_mailinator
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@mailinator.com
    wait until element is visible       ${TMBusinessEmail}    60
    input text   ${TMBusinessEmail}   ${generated_TMbusinessEmail}
    log to console      ${generated_TMbusinessEmail}

Enter team member business email with cool fr nf email
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@cool.fr.nf
    wait until element is visible       ${TMBusinessEmail}    60
    input text   ${TMBusinessEmail}   ${generated_TMbusinessEmail}
    log to console      ${generated_TMbusinessEmail}
    set global variable     ${generated_TMbusinessEmail}


Click on team member department
    wait until element is enabled     ${TMDepartmentName}     60
    wait until element is visible     ${TMDepartmentName}      60
    click element   ${TMDepartmentName}

Click on add here in department field
    [Arguments]    ${option}
    Generic.click on the tab    ${option}
#    wait until element is visible   //a[normalize-space()='Click here to add']      60
#    wait until element is enabled        //a[normalize-space()='Click here to add']      60
#    click element       //a[normalize-space()='Click here to add']

Select team member department
    [Arguments]    ${option}
    wait until element is visible       ${TMDepartmentName}     60
    input text      ${TMDepartmentName}         ${option}
    Generic.Select parameter        ${option}


Select team member role
    [Arguments]    ${option}
    Generic.Enter value into field  ${TMRole}     ${option}
    Generic.Select parameter        ${option}

Click on team member location
    wait until element is visible     ${TMLocation}     60
    wait until element is enabled     ${TMLocation}      60
    click element   ${TMLocation}

Select team member location
    wait until element is visible     //div[contains (@id, '-2')]       60
    wait until element is enabled     //div[contains (@id, '-2')]       60
    click element   //div[contains (@id, '-2')]

Save the team member form
    [Arguments]    ${option}
    wait until element is visible     css:.${option}-member-qa       60
    wait until element is enabled     css:.${option}-member-qa       60
    click element   css:.${option}-member-qa

Enter the Position in member form
    [Arguments]    ${option}
    wait until element is visible       css:#Position       60
    input text      css:#Position       ${option}

Search Team Member by name
    [Arguments]    ${name}
    wait until element is visible       css:thead tr       60
    wait until element is visible      ${name_SearchBar}     60
    click element      ${name_SearchBar}
    Clear Element Text      ${name_SearchBar}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${name_SearchBar}   ${name}
    sleep      ${search_sleep}
    wait until element is visible       css:thead tr       60

Click on three dots of Team Member listing
    wait until element is visible   ${three_dots}   60
    click element   ${three_dots}

Select option from three dots of Team Member
    [Arguments]     ${option}
    Generic.Select other option from profile list       ${option}

Click on the tab
    [Arguments]         ${option}
    wait until element is visible       css:#member-${option}-tab     60
    click element       css:#member-${option}-tab

Click on the button
    [Arguments]    ${option}
    Generic.Click on the button     ${option}

Search the department name
    [Arguments]    ${name}
    wait until element is visible       css:thead tr       60
    wait until element is visible      ${Dept_SearchBar}     60
    click element      ${Dept_SearchBar}
    Clear Element Text      ${Dept_SearchBar}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${Dept_SearchBar}   ${name}


Verify resulted row contains Dept_name
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible       css:.table.department       60
    sleep       ${search_sleep}
    Table column should contain      css:.table.department      2       ${generated_DepartmentNumber}

Select team member location with new domain
    wait until element is visible     //div[contains (@id, '-0')]       60
    wait until element is enabled     //div[contains (@id, '-0')]       60
    click element   //div[contains (@id, '-0')]

verify status of first name in member list
    [Arguments]     ${option}
    wait until element is visible   //td[normalize-space()='${option}']     60

Click on back to member list of member list
    wait until element is visible   css:span[class='back']      60
    click element   css:span[class='back']

Click on search by brand, product and asset id of asset history via team member
    [Arguments]     ${option}
    wait until element is visible   css:.search-location-qa     60
    click element   css:.search-location-qa
    input text  css:.search-location-qa     ${option}

Verify table data with asset id in team member
    Table Column Should contain     css:.table-hover    2       ${generated_AssetID}

Click on i-icon of team-members tab
    wait until element is visible       css:#member-list-Iicon      60
    click element       css:#member-list-Iicon

Click on action button of assigned users
    wait until element is not visible      ${loaderIcon}    60
    wait until element is visible   css:#Assignee-Actions      60
    click element   css:#Assignee-Actions

Enter first name of assigned users
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMFname}=    Catenate    TMFname_${random_string}
    wait until element is visible       css:.qa-AssignedFirstName     60
    input text   css:.qa-AssignedFirstName    ${generated_TMFname}
    log to console      ${generated_TMFname}
    set global variable       ${generated_TMFname}

Enter last name of assigned users
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMLname}=    Catenate    TMLast_${random_string}
    wait until element is visible       css:.qa-AssignedLastName    60
    input text   css:.qa-AssignedLastName   ${generated_TMLname}
    log to console      ${generated_TMLname}

Enter business email of assigned users
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@yopmail.net
    wait until element is visible       css:.qa-AssignedEmail    60
    input text   css:.qa-AssignedEmail   ${generated_TMbusinessEmail}
    log to console      ${generated_TMbusinessEmail}

Click on save button of assigned user
    wait until element is visible   css:.qa-save-assignee-modal     60
    click element   css:.qa-save-assignee-modal

Search assigned user by first name
    [Arguments]    ${name}
    wait until element is visible       css:thead tr       60
    wait until element is visible      css:input[placeholder='Search by Assignee Name or Employee Id']     60
    click element      css:input[placeholder='Search by Assignee Name or Employee Id']
    input text   css:input[placeholder='Search by Assignee Name or Employee Id']   ${name}
    sleep      ${search_sleep}
    wait until element is visible       css:thead tr       60

Enter assign to field
    [Arguments]     ${option}
    wait until element is visible   //ng-select[contains(@placeholder,'Select Assignee')]//span[contains(@title,'Clear all')]   60
    click element   //ng-select[contains(@placeholder,'Select Assignee')]//span[contains(@title,'Clear all')]
    click element   css:#assignTO
    input text   css:#assignTO   ${option}
    wait until element is visible  //span[normalize-space()='${option}']    60
    click element   //span[normalize-space()='${option}']

Search assigned user by asset id
    [Arguments]    ${name}
    wait until element is visible       css:.table-hover tr       60
    wait until element is visible      css:.search-location-qa     60
    click element      css:.search-location-qa
    input text   css:.search-location-qa   ${name}
    sleep      ${search_sleep}
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible       css:.table-hover tr       60

Click on view button link of assigned user
    wait until element is visible   //td[normalize-space()='View']      60
    click element   //td[normalize-space()='View']