*** Settings ***
Documentation     Contains all keyword of Two Factor Authentication page
Library           SeleniumLibrary
Library           ExcelLibrary
Library           String
Library           Collections
Library           BuiltIn
Library           random
Library           DateTime
Library           OperatingSystem
Resource        ../Pages/Generic.robot
Resource        ../Pages/DashboardPage.robot
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/RegisterMember.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/BillingPage.robot

*** Variables ***
${billing_details_arrow}     css:.fa.fa-chevron-right.ng-star-inserted
${billing_add_new_card}     css:.qa-add-new-card-bank
${ach_account_number}     css:#accountNumber
${ach_routing_number}     css:#routingNumber
${ach_name}     css:#name


${billing_future_trans_line}     css:.qa-future
${billing_trash_icon}     css:.fa-trash-alt


*** Keywords ***
Click on the arrow of billing details
    Wait Until Element Is Visible       ${billing_details_arrow}    60
    Wait Until Element Is Enabled       ${billing_details_arrow}     60
    click element       ${billing_details_arrow}

Click on add new card/bank
    Wait Until Element Is Visible       ${billing_add_new_card}     60
    Wait Until Element Is Enabled       ${billing_add_new_card}      60
    click element      ${billing_add_new_card}

Select the billing payment type
    [Arguments]    ${option}
    Wait Until Element Is Visible       css:.fa-${option}    60
    Wait Until Element Is Enabled       css:.fa-${option}     60
    click element       css:.fa-${option}
#options: credit-card, university

Enter billing account number
    [Arguments]    ${option}
    Generic.Enter value into field  ${ach_account_number}       ${option}

Enter billing routing number
    [Arguments]    ${option}
    Generic.Enter value into field  ${ach_routing_number}        ${option}

Enter billing account type
    [Arguments]    ${option}
    Generic.Enter value into field  ${ach_name}       ${option}

Save the billing payment form
    [Arguments]    ${option}
    Wait Until Element Is Visible       css:.qa-payment-form-${option}    60
    Wait Until Element Is Enabled       css:.qa-payment-form-${option}     60
    click element       css:.qa-payment-form-${option}
#options: save, cancel

Save the status of set as primary account
    [Arguments]    ${option}
    sleep       ${search_sleep}
    Wait Until Element Is Visible       css:.qa-${option}-    60
    Wait Until Element Is Enabled       css:.qa-${option}-     60
    click element       css:.qa-${option}-
#options: cancel,confirm

Confirm if you want to delect account
    [Arguments]    ${option}
    sleep       ${search_sleep}
    Wait Until Element Is Visible       css:.qa-${option}-    60
    Wait Until Element Is Enabled       css:.qa-${option}-     60
    click element       css:.qa-${option}-
#options: cancel,confirm

Close the billing payment options module
    Wait Until Element Is Visible       css:div[id='updateCard'] button[aria-label='Close'] span    60
    Wait Until Element Is Enabled       css:div[id='updateCard'] button[aria-label='Close'] span     60
    click element       css:div[id='updateCard'] button[aria-label='Close'] span


Click on future transaction link
    Wait Until Element Is Visible       ${billing_future_trans_line}   60
    Wait Until Element Is Enabled       ${billing_future_trans_line}     60
    click element      ${billing_future_trans_line}

Click on billing trash to remove card
    Wait Until Element Is Visible       ${billing_trash_icon}   60
    Wait Until Element Is Enabled       ${billing_trash_icon}    60
    click element      ${billing_trash_icon}