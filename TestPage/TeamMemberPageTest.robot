*** Settings ***
Documentation   Contains all test cases of Team member page
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
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Create team member form
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Select option from team member action menu
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email
    TeamMemberPage.Click on team member department
#    TeamMemberPage.Select team member department
    TeamMemberPage.Select team member department        DepartmentName09041
    TeamMemberPage.Select team member role     CSPM
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location
    TeamMemberPage.Save the team member form   save

Add Team member page - Add New Department and assign that department to Team member
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email_mailinator
    TeamMemberPage.Enter the Position in member form        QA
    sleep       ${yop_sleep}
    TeamMemberPage.Click on add here in department field        Click here to add
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TeamMemberPage.Select team member department        ${generated_DepartmentNumber}
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}

Edit Team member page - Edit New Department and assign that department to Team member
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email_mailinator
    TeamMemberPage.Enter the Position in member form        QA
    sleep       ${yop_sleep}
    TeamMemberPage.Click on add here in department field        Click here to add
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TeamMemberPage.Select team member department        ${generated_DepartmentNumber}
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Details
    TeamMemberPage.Click on the tab         details
    TeamMemberPage.Click on the button      Edit
    Generic.Verify your current page location contains      updatemembers
    TeamMemberPage.Click on add here in department field        Click here to add
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TeamMemberPage.Click on the button      Update
    Generic.Fetch alert message text and compare it with        Team Member updated successfully
    Generic.Verify your current page location contains          memberslist

Verify team member Asset history
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email with cool fr nf email
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location with new domain
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.Open new window     yopmail
    Generic.Search yopmail emails for   ${generated_TMbusinessEmail}
    Generic.Switch to iframe by ID      ifmail
    Generic.click on the button     Verify
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    UserAccount.Enter the password      Test@456
    UserAccount.Confirm the entered password    Test@456
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generated_TMbusinessEmail}    Test@456
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains     asset-overview
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch alert message text and compare it with        Successfully logged out
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.verify status of first name in member list   Active
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click technology product input field
    TechnologyPage.Select the first value of To dropdown of product
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     Asset History

Verify all i-icon of team member page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on i-icon of team-members tab
    Generic.Verify pop-up is visible after clicking on i-icon
    TeamMemberPage.Click on i-icon of team-members tab

Search asset history with Asset ID
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email with cool fr nf email
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location with new domain
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.Open new window     yopmail
    Generic.Search yopmail emails for   ${generated_TMbusinessEmail}
    Generic.Switch to iframe by ID      ifmail
    Generic.click on the button     Verify
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    UserAccount.Enter the password      Test@456
    UserAccount.Confirm the entered password    Test@456
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generated_TMbusinessEmail}    Test@456
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains     asset-overview
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch alert message text and compare it with        Successfully logged out
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.verify status of first name in member list   Active
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click technology product input field
    TechnologyPage.Select the first value of To dropdown of product
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     TMFname_
    TeamMemberPage.Click on back to member list of member list
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    Generic.click on the tab    1
    Generic.Verify your current page location contains      technology-list
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Edit
    TechnologyPage.Add assignment information assign to   Member jh
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page contains this text             Technology
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    TeamMemberPage.Click on search by brand, product and asset id of asset history via team member  ${generated_AssetID}
    TeamMemberPage.Verify table data with asset id in team member

Verify asset history of assigned users
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    wait until element is not visible      ${loaderIcon}    60
    Generic.Select parameter     Assigned Users
    TeamMemberPage.Click on action button of assigned users
    Generic.click on the button link    Add Assignee
    TeamMemberPage.Enter first name of assigned users
    TeamMemberPage.Enter last name of assigned users
    TeamMemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    TeamMemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    TeamMemberPage.Search assigned user by first name   ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     Export
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click technology product input field
    TechnologyPage.Select the first value of To dropdown of product
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    TeamMemberPage.Enter assign to field        Dc Dc
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    wait until element is not visible      ${loaderIcon}    60
    Generic.Select parameter     Assigned Users
    TeamMemberPage.Search assigned user by first name   ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page location contains      asset-history
    TeamMemberPage.Search assigned user by asset id     ${generated_AssetID}
    TeamMemberPage.Click on view button link of assigned user
    Generic.Verify your current page contains this text     Technology