*** Settings ***
Documentation   Contains all keyword of  Dashboard page
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
${Error_Message_Login}      css:.alert.alert-danger.col-md-12
${login_heading}        css:.heading-login.d-inline-block
${drawerList}       //ul[@class='list-unstyled w-100 d-inline-block mt-3 pt-0']/li
${side_options}     //ul[@id='common-side-bar-left']//li
${profile_option}        //img[@alt='icon']
${loaderIcon}     //div[@role='status']

###############profile option##########
${profileName}     css:#user-name-nav
${full_Profile_List}     //div[@class='dropdown-menu themeScrollBar profile-dropdown ng-tns-c166-0 show']/div/ul/li
#//div[@aria-labelledby='dropdownMenuButton']//li
######## Add brand #########
${add_Brand}    css:a[title='Click here to Add Brand']
${add_brandName}    css:#Name
${add_brand_mfc_URL}    //input[@formcontrolname='Domain']
${brand_country}    css:#brandCountry
${select_country}   css:.ng-option-label.ng-star-inserted

${brand_saveBTN}        //button[@title='Click here to Save']
${brand_saveBtn_main}     css:.add-brand-qa
${search_brandName}     css:input[placeholder='Search by Brand Name']
${fetch_brandName}    css:td:nth-child(2)


########## Add product #####

${add_Product}     css:a[title='Click here to Add Product']
${actionBTN}       css:#Team-Member-Actions
${add_Product_modal}     css:div[id='addProductPopup'] div[role='document'] div[role='document'] div[class='modal-content']
${ProductName}     css:#ProductName
${enterAndSelect_Brand}     css:.qa-BrandName input
#${ProductDescription}     //div[@class='card-container themeScrollBar mt-1 p-2']//textarea[@id='ProductDescription']
${ProductDescription}       css:.qa-add-product-description
${ProductDescription_viaLink}     css:#ProductDescription
${ProductFeatures}     css:#ProductFeatures


${ProductFeatures_viaLink}      css:#addProductFeat

${ProductStatus}     //input[@id='ProductStatus']
${ProductStatus_viaLink}        css:#addProductStatus

${select_technology_group}     css:nz-tree-select[id='TechGroupId'] div nz-select-search
${select_technology_type}     //div[@class='ng-select-container'][normalize-space()='Select Technology Type']
${select_technology_type_via link}  css:#addProductType
${save_product_modal}     css:button[class='btn button-green mt-0 mx-2 ng-star-inserted']
${search_productName}     css:input[placeholder='Search by Product Name or Description']
${fetch_productName}    css:td:nth-child(2)

${add_dept_btn}     //a[normalize-space()='Add Department']
${add_dept_name}     css:.profile-section-department div ng-select#department-name input
${add_dept_status}     css:.profile-section-department div ng-select.qa-add-department-status input
${add_dept_costCenter}     css:.profile-section-department .qa-add-department-costCenter


${searchBar_department}     css:input[placeholder='Search by Department Name']
${fetch_departmentName}     css:td:nth-child(2)

${address_Line}     css:#addressLine1
${address_line2}    css:#addressLine2
${brand_linklist}   css:.qa-back-brand-list
${brandnew_addressstate}    css:#addressState
${editnew_brandaddressline2}    css:input[formcontrolname=StreetAddress2]
${editnew_brandaddressline1}    css:#CompanyAddressId
${editcity_edit}        css:#addressCity
${editstate_edit}       css:#addressState
${editbrand_addressline2}   css:input[formcontrolname=StreetAddress2]
${editbrand_addressline1}   css:input[formcontrolname=StreetAddress1]
${brand_crossicon}      //div[@class='row no-gutters mb-1']//div[2]//div[1]//div[2]//span[1]
${brandadd_urlplusicon}     css:i[title='Click here to add Business url']
${Brand_threedots}      css:.three-dots
${brand_mainsaveButton}     //button[@type='button'][normalize-space()='Save']
${Viewyour_addedbrandlist}      //a[normalize-space()='View Your Added Brand List']
${Editaddress_icon}     css:i[title='Click here to edit address']
${zipcode_input}        css:#zip
${Brand_savebutton}     css:button[aria-label='Close'][type='submit']
${add brand_link}   //a[normalize-space()='Add Brand']
${Select_city while adding brand}   css:#City
${Select_state while adding brand}  css:#State
${clickadd_newaddress}  //span[@title='Click here to add address']
${share_toEmail}      css:#toEmail
${Totalcount_field}        css:.qa-total-count-list
${dept_searchbar}       css:input[placeholder='Search by Department Name']
${three_dots_dept}      css:.three-dots

*** Keywords ***
Click on add department
    wait until element is visible      ${add_dept_btn}      60
    wait until element is enabled      ${add_dept_btn}      60
    click element      ${add_dept_btn}


Save the department
    [Arguments]    ${option}
    wait until element is visible       css:.profile-section-department div button.qa-${option}-department-modal      60
    click element       css:.profile-section-department div button.qa-${option}-department-modal
#options: add, close


Select the option from action menu
    [Arguments]    ${option}
    wait until element is visible       css:.qa-product-bulk-${option}     60
    wait until element is enabled       css:.qa-product-bulk-${option}     60
    click element   css:.qa-product-bulk-${option}

Select the option from department action menu
    [Arguments]    ${option}
    wait until element is visible       css:a[title='${option}']     60
    wait until element is enabled       css:a[title='${option}']     60
    click element   css:a[title='${option}']

Select brand from list
    [Arguments]    ${BrandName}
    wait until element is visible       ${enterAndSelect_Brand}     60
    click element   ${enterAndSelect_Brand}
    Clear Element Text      ${enterAndSelect_Brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${enterAndSelect_Brand}     ${BrandName}
    Generic.Select parameter     ${BrandName}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  3  ${pageHeading}   DashboardPage - Select brand from list      3    ${pageTime}     ${ActualTime}    DashboardPage_Time

Select product from list
    [Arguments]    ${ProductName}
    wait until element is visible       ${enterAndSelect_Brand}     60
    click element   ${enterAndSelect_Brand}
    Clear Element Text      ${enterAndSelect_Brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${enterAndSelect_Brand}   ${ProductName}
    Generic.Select parameter     ${ProductName}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  4  ${pageHeading}   DashboardPage - Select product from list      4    ${pageTime}     ${ActualTime}    DashboardPage_Time


Select an option from company details side list
    [Arguments]    ${option}
    Generic.Select parameter    ${option}

Click on download agent button to download
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Generic.click on the button     ${option}

Create random productName
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_product}=    Catenate    Product_${random_string}
    input text   ${ProductName}   ${generated_product}
    log to console      ${generated_product}
    set global variable    ${generated_product}

Click on action button
    wait until element is visible       ${actionBTN}   60
    click element       ${actionBTN}

Click add product button
    wait until element is visible       ${add_Product}   60
    wait until element is enabled       ${add_Product}   60
    click element       ${add_Product}
    wait until element is visible       ${add_Product_modal}    60
    wait until element is visible       ${ProductName}      60

Create product name random
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_product}=    Catenate    Product_${random_string}
    input text   ${ProductName}   ${generated_product}
    log to console      ${generated_product}
    set global variable    ${generated_product}

Create product name self
    [Arguments]    ${option}
    wait until element is visible   ${ProductName}      60
    input text   ${ProductName}   ${option}


Add product brand name
    [Arguments]    ${option}
    wait until element is visible       ${enterAndSelect_Brand}     60
    click element   ${enterAndSelect_Brand}
    Clear Element Text      ${enterAndSelect_Brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${enterAndSelect_Brand}    ${option}
    Generic.Select parameter     ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  5  ${pageHeading}   DashboardPage - Add product brand name      5    ${pageTime}     ${ActualTime}    DashboardPage_Time
    sleep   ${search_sleep}

Add product description
    wait until element is visible       ${ProductDescription}     60
    input text   ${ProductDescription}   This is the description of new product added.

Add product description via link
    wait until element is visible       ${ProductDescription_viaLink}     60
    input text   ${ProductDescription_viaLink}   This is the description of new product added.

Add product feature
    wait until element is visible       ${ProductFeatures}     60
    input text   ${ProductFeatures}   This is the features of new product added.

Add product feature via link
    wait until element is visible       ${ProductFeatures_viaLink}     60
    input text   ${ProductFeatures_viaLink}   This is the features of new product added.

Select product status
    [Arguments]    ${option}
    wait until element is visible       ${ProductStatus}     60
    click element   ${ProductStatus}
    Clear Element Text      ${ProductStatus}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${ProductStatus}   ${option}
    Generic.Select parameter     ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   DashboardPage - Select product status      6    ${pageTime}     ${ActualTime}    DashboardPage_Time

Select product status via link
    [Arguments]    ${option}
    scroll element into view    css:#addProductType
    wait until element is visible       ${ProductStatus_viaLink}     60
    click element   ${ProductStatus_viaLink}
    Clear Element Text      ${ProductStatus_viaLink}
    input text   ${ProductStatus_viaLink}   ${option}
    Generic.Select parameter     ${option}

Select product technology type
    [Arguments]    ${option}
    wait until element is visible       ${select_technology_type}     60
    ${StartTime1} =     Get Current Time in Milliseconds
    click element   ${select_technology_type}
    Generic.Select parameter     ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   DashboardPage - Select product technology type      7    ${pageTime}     ${ActualTime}    DashboardPage_Time

Select product technology type via technology
    [Arguments]    ${option}
    Generic.Scroll the page till    900
    wait until element is visible       ${select_technology_type_via link}     60
    click element   ${select_technology_type_via link}
    Generic.Select parameter     ${option}

Select product technology group
    [Arguments]    ${option}
    wait until element is visible       ${select_technology_group}     60
    Mouse Over      ${select_technology_group}
    click element   ${select_technology_group}
    Scroll Element Into View        //span[normalize-space()='${option}']
    wait until element is visible      //span[normalize-space()='${option}']       60
    click element       //span[normalize-space()='${option}']

Select product technology group via link
    [Arguments]    ${option}
    wait until element is visible       css:nz-tree-select[formcontrolname=TechGroupId] input     60
    Mouse Over      css:nz-tree-select[formcontrolname=TechGroupId] input
    click element   css:nz-tree-select[formcontrolname=TechGroupId] input
    Scroll Element Into View        //span[normalize-space()='${option}']
    wait until element is visible      //span[normalize-space()='${option}']       60
    click element       //span[normalize-space()='${option}']

Save added product details
    wait until element is visible      ${save_product_modal}       60
    click element   ${save_product_modal}
    Wait Until Element Is Not Visible    ${loaderIcon}      60


Verify product added
   [Arguments]    ${productName}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${search_productName}     60
     click element      ${search_productName}
     Clear Element Text      ${search_productName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_productName}   ${productName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${productName}']      ${productName}     60
     ${get_productName} =    get text    ${fetch_productName}
     log to console     ${get_productName}
     should be equal    ${productName}     ${get_productName}
     ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  8  ${pageHeading}   DashboardPage - Verify product added      8    ${pageTime}     ${ActualTime}    DashboardPage_Time


Click add brand button
    wait until element is visible       ${add_Brand}        60
    click element   ${add_Brand}


Create random brandName
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_BrandName}=    Catenate    BrandName${random_string}
    input text   ${add_brandName}   ${generated_BrandName}
    log to console      ${generated_BrandName}
    set global variable    ${generated_BrandName}


Add self created brand name
    [Arguments]    ${option}
    wait until element is visible       ${add_brandName}        60
    input text   ${add_brandName}   ${option}
    log to console      ${generated_BrandName}

Add business manufacturer URL
    [Arguments]    ${option}
    ${generated_BrandURL}=    Catenate    ${option}.com
    input text   ${add_brand_mfc_URL}   ${generated_BrandURL}
    log to console      ${generated_BrandURL}
    set global variable    ${generated_BrandURL}

Add brand manufacturer country
    [Arguments]    ${country}
    click element   ${brand_country}
    Clear Element Text      ${brand_country}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${brand_country}   ${country}
    Generic.Select parameter     ${country}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  9  ${pageHeading}   DashboardPage - Add brand manufacturer country      9    ${pageTime}     ${ActualTime}    DashboardPage_Time


Save added brand details
    wait until element is visible       ${brand_saveBTN}        60
    click element   ${brand_saveBTN}

Click added brand main save button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible       ${brand_saveBtn_main}
    click element   ${brand_saveBtn_main}

Verify Brand added
   [Arguments]    ${BrandName}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${search_brandName}     60
     click element      ${search_brandName}
     Clear Element Text      ${search_brandName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_brandName}   ${BrandName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${BrandName}']      ${BrandName}     60
     ${get_brandName} =    get text    ${fetch_brandName}
     log to console     ${get_brandName}
     should be equal    ${BrandName}     ${get_brandName}
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time  10  ${pageHeading}   DashboardPage - Verify Brand added      10    ${pageTime}     ${ActualTime}    DashboardPage_Time

select the option from the dashboard drawer
    [Arguments]     ${option}
    wait until element is visible    //span[normalize-space()='${option}']      60
    click element    //span[normalize-space()='${option}']

################################### WELCOME PAGE AND AHEAD ###############
Click on complete setup button
    [Arguments]     ${option}
    wait until element is visible    //button[normalize-space()='${option}']        60
    click element    //button[normalize-space()='${option}']

Select the asset ID checkbox
    [Arguments]     ${option}
    wait until element is visible    css:.checkmark.qa-inner-customcheckbox-asset-id-${option}      60
    click element    css:.checkmark.qa-inner-customcheckbox-asset-id-${option}

Select the employee ID checkbox
    [Arguments]     ${option}
    wait until element is visible    css:.checkmark.qa-inner-customcheckbox-employee-id-${option}       60
    click element    css:.checkmark.qa-inner-customcheckbox-employee-id-${option}

Select the location ID checkbox
    [Arguments]     ${option}
    wait until element is visible    css:.checkmark.qa-inner-customcheckbox-location-id-${option}       60
    click element    css:.checkmark.qa-inner-customcheckbox-location-id-${option}
#options: ProductId, BrandName, ProductStatus,TechType, GroupName, ProductDescription

Enter the new value in the product name column
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_EditProductName}=    Catenate    ProductName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditProductName}
    set global variable    ${generated_EditProductName}

Enter the new value in the brand name column
    [Arguments]    ${option}    ${brandName}
    DashboardPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${brandName}

Select option from status column
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[class='ag-rich-select-row']    60
    click element       css:div[class='ag-rich-select-row']

Select option from technology type column
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[aria-label='List'] div:nth-child(4) div    60
    click element       css:div[aria-label='List'] div:nth-child(4) div

Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

Create unique department name random
    wait until element is visible       ${add_dept_name}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_DepartmentNumber}=    Catenate    DeptNo_${random_string}
    input text   ${add_dept_name}   ${generated_DepartmentNumber}
    sleep       1
    click element     css:div[role='option']
    log to console      ${generated_DepartmentNumber}
    set global variable    ${generated_DepartmentNumber}

Select department status
    [Arguments]    ${option}
    wait until element is visible       ${add_dept_status}        60
    click element     ${add_dept_status}
    Clear Element Text      ${add_dept_status}
    Generic.Select parameter    ${option}

Select department cost center
    [Arguments]    ${option}
    wait until element is visible       ${add_dept_costCenter}        60
    input text    ${add_dept_costCenter}   ${option}

Verify department added
   [Arguments]    ${departmentName}
    wait until element is visible       css:thead tr       60
    wait until element is visible      ${searchBar_department}     60
    click element      ${searchBar_department}
    Clear Element Text      ${searchBar_department}
    input text   ${searchBar_department}   ${departmentName}
    sleep       ${search_sleep}
    Wait Until Element Contains    //td[normalize-space()='${departmentName}']      ${departmentName}     60
    ${get_departmentName} =    get text    ${fetch_departmentName}
    log to console     ${get_departmentName}
    should be equal    ${departmentName}     ${get_departmentName}

Enter the new value in the department name column
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_EditDepartmentName}=    Catenate    DepartmentName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditDepartmentName}
    set global variable    ${generated_EditDepartmentName}

Select option from department status column
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:.ag-rich-select-row.ag-rich-select-row-selected    60
    click element       css:.ag-rich-select-row.ag-rich-select-row-selected

Enter the new value in the cost center column
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       4      [NUMBERS]
    ${generated_EditCostCenter}=    Catenate    ${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditCostCenter}
    set global variable    ${generated_EditCostCenter}

Verify the upload message text
    [Arguments]    ${option}    ${text}
    wait until element is not visible      ${loaderIcon}     60
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']     60
    ${fetch_text} =    get text    css:.ag-center-cols-container div[col-id='${option}']
    log to console  uploadtext:${fetch_text}
    should be equal    ${fetch_text}    ${text}

Confirm the exit import process pop appers
    Wait Until Element Is Visible    ${assignedUser_Edit_popUp}      60

Verify the side option list parameters
   wait until element is visible   ${side_options}      60
   @{expectedList} =    Create List        Aithentic logo    Dashboard       Messages        Location        Team Members      Partners      Contracts      Technology      Asecure Cloud Login
   ${elements} =  Get WebElements     ${side_options}
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      ${title}=    Get Element Attribute    ${element}    title
      Append To List    ${actualList}     ${title}
   END
   lists should be equal    ${expectedList}    ${actualList}

Verify the drawer list parameters
   wait until element is visible   ${drawerList}        60
   @{expectedList} =    Create List      Asset Overview     IT Performance       Subscription        Reports
   ${elements} =  Get WebElements     ${drawerList}
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      log to console    ${element.text}
      Append To List    ${actualList}     ${element.text}
   END
   lists should be equal    ${expectedList}    ${actualList}

#####NOT WORKING#########
Verify the profile option list parameters
    wait until element is visible    ${profile_option}      60
    click element    ${profile_option}
    sleep       2
    ${elements} =  Get WebElements     ${full_Profile_List}
    @{actualList} =   Create List
    FOR  ${element}  IN      @{elements}

      log to console    ${element.text}
      Append To List    ${actualList}     ${element.text}
    END

Select Technology from personal deatils section
    [Arguments]     ${option}
    wait until element is visible   xpath://span[normalize-space()='${option}']     60
    click element   xpath://span[normalize-space()='${option}']

Click on View Your Added Brand List
    wait until element is visible   ${Viewyour_addedbrandlist}   60
    click element   ${Viewyour_addedbrandlist}

Click on Add New Address
    wait until element is visible   ${clickadd_newaddress}    60
    click element   ${clickadd_newaddress}

Enter Brand Address Line one
    wait until element is not visible   ${loaderIcon}    60
    wait until element is visible     ${address_Line}         60
    wait until element is enabled     ${address_Line}         60
    click element      ${address_Line}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_AddressLineone}=    Catenate    Address_${random_string}
    input text      ${address_Line}     ${generate_AddressLineone}
    log to console      ${generate_AddressLineone}

Enter Brand address line two
    wait until element is visible     ${address_line2}         60
    wait until element is enabled     ${address_line2}         60
    click element      ${address_line2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_AddressLine2}=    Catenate    Address_${random_string}
    input text      ${address_line2}     ${generate_AddressLine2}
    log to console      ${generate_AddressLine2}

Select State
    [Arguments]     ${country}
    Wait until element is visible   ${Select_state while adding brand}  60
    click element   ${Select_state while adding brand}
    wait until element is visible   css:span[title='${country}']    60
    click element   css:span[title='${country}']

Select City
    [Arguments]     ${city}
    wait until element is not visible       ${loaderIcon}    60
    wait until element is visible   ${Select_city while adding brand}   60
    click element   ${Select_city while adding brand}
    wait until element is visible   css:span[title='${city}']     60
    click element   css:span[title='${city}']

Click on Save Button
    wait until element is visible   ${Brand_savebutton}   60
    click element   ${Brand_savebutton}

Zip code Input
    [Arguments]     ${code}
    wait until element is visible   ${zipcode_input}    60
    click element   ${zipcode_input}
    input text  ${zipcode_input}    ${code}

Click on Edit address
    wait until element is visible   ${Editaddress_icon}   60
    click element   ${Editaddress_icon}
    wait until element is not visible       ${loaderIcon}    60

Enter Brand New Address Line one
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible     ${address_Line}         60
    click element      ${address_Line}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddressone}=    Catenate    Address_${random_string}
    input text      ${address_Line}     ${generate_newaddressone}
    Press Keys  ${address_Line}            ENTER
    log to console      ${generate_newaddressone}

Enter Brand new address line two
    wait until element is visible     ${address_line2}         60
    click element      ${address_line2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddresstwo}=    Catenate    Address_${random_string}
    input text      ${address_line2}     ${generate_newaddresstwo}
    log to console  ${generate_newaddresstwo}

Click on main Save Button
    wait until element is visible   ${brand_mainsaveButton}    60
    click element   ${brand_mainsaveButton}

click on share icon of dashboard page
    wait until element is visible       css:.fa-share-alt              60
    click element       css:.fa-share-alt

Enter to Email into popup
    wait until element is visible      ${share_toEmail}         60
    click element       ${share_toEmail}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_sharetoEmail}=    Catenate    ToEmail_${random_string}@yopmail.net
    input text      ${share_toEmail}     ${generate_sharetoEmail}
    log to console      ${generate_sharetoEmail}
    set global variable    ${generate_sharetoEmail}

Click on Send Invite button
   Generic.click on the button     Send Invite

Click on Register button in email
    wait until element is visible       css:button[type='button']       60
    click element       css:button[type='button']

Enter business email
    wait until element is enabled       ${register_Email}        60
    click element   ${register_Email}
    Clear element text      ${register_Email}
    input text      ${register_Email}       ${generate_sharetoEmail}

Enter account_holder_name
    wait until element is visible       css:.ng-pristine .ng-touched        60
    click element       css:.ng-pristine .ng-touched
    input text      css:.ng-pristine .ng-touched        Tanisha

click on Help center icon of dashboard page
    wait until element is visible       css:.fa-question-circle         60
    click element       css:.fa-question-circle

Click on link of information center list
    [Arguments]     ${link_name}
    wait until element is visible       //span[contains(text(),'${link_name}')]     60
    click element       //span[contains(text(),'${link_name}')]

Click on link of Support
    [Arguments]     ${link_name}
    wait until element is visible       //span[contains(text(),'${link_name}')]     60
    click element       //span[contains(text(),'${link_name}')]

Search any keyword of FAQ section
    [Arguments]    ${option}
    Generic.Enter value into field      css:#questions      ${option}


Verify the keyword
    [Arguments]    ${option}
    wait until element is visible    //div[contains(text(),'${option}')]      60


Verify no result found with wrong FAQ
    wait until element is visible      //div[normalize-space()='No results found']        60


Click on three dots
    wait until element is visible   ${Brand_threedots}   60
    click element   ${Brand_threedots}

click on Plus icon
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible   ${brandadd_urlplusicon}   60
    click element   ${brandadd_urlplusicon}

Add static Business Manufacturer URL
    [Arguments]    ${option}
    wait until element is visible       ${add_brand_mfc_URL}
    click element       ${add_brand_mfc_URL}
    input text      ${add_brand_mfc_URL}        ${option}

Click on Cross Icon
    wait until element is visible   ${brand_crossicon}    60
    click element   ${brand_crossicon}

Edit Brand Address Line one
    wait until element is not visible   ${loaderIcon}    60
    wait until element is visible   ${editbrand_addressline1}           60
    wait until element is enabled     ${editbrand_addressline1}         60
    click element      ${editbrand_addressline1}
    Clear Element Text  ${editbrand_addressline1}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_editAddressLine1}=    Catenate    Address_${random_string}
    input text   ${editbrand_addressline1}       ${generate_editAddressLine1}
    log to console      ${generate_editAddressLine1}

Edit Brand Address Line two
    wait until element is not visible   ${loaderIcon}    60
    wait until element is visible   ${editbrand_addressline2}           60
    wait until element is enabled     css:#StreetAddress2         60
    click element      ${editbrand_addressline2}
    Clear Element Text  ${editbrand_addressline2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_editAddressLine2}=    Catenate    Address_${random_string}
    input text   ${editbrand_addressline2}        ${generate_editAddressLine2}
    log to console      ${generate_editAddressLine2}

Edit State while edit address
    [Arguments]     ${State}
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible  ${editstate_edit}   60
    wait until element is enabled  ${editstate_edit}   60
    click element  css:ng-select[placeholder='Select State'] span[title='Clear all']
    click element   ${editstate_edit}
    wait until element is visible   css:span[title='${State}']   60
    click element   css:span[title='${State}']

Edit city while edit address
    [Arguments]     ${city}
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible   ${editcity_edit}   60
    click element   ${editcity_edit}
    wait until element is visible   css:span[title='${city}']   60
    click element   css:span[title='${city}']

Edit New Brand Address Line one
    wait until element is not visible   ${loaderIcon}    60
    wait until element is visible   ${editnew_brandaddressline1}           60
    wait until element is enabled     ${editnew_brandaddressline1}         60
    click element      ${editnew_brandaddressline1}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generateNew_editAddressLine1}=    Catenate    Address_${random_string}
    input text   ${editnew_brandaddressline1}       ${generateNew_editAddressLine1}
    Press Keys  ${editnew_brandaddressline1}             ENTER
    log to console      ${generateNew_editAddressLine1}

Edit New Brand Address Line two
    wait until element is not visible   ${loaderIcon}    60
    wait until element is visible   ${editnew_brandaddressline2}           60
    wait until element is enabled     ${editnew_brandaddressline2}         60
    click element      ${editnew_brandaddressline2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generateNew_editAddressLine2}=    Catenate    Address_${random_string}
    input text   ${editnew_brandaddressline2}        ${generateNew_editAddressLine2}
    log to console      ${generateNew_editAddressLine2}

Select New Address State
    [Arguments]     ${country}
    Wait until element is visible   ${brandnew_addressstate}  60
    click element   ${brandnew_addressstate}
    wait until element is visible   css:span[title='${country}']    60
    click element   css:span[title='${country}']

Click on back to brand list link
    wait until element is visible   ${brand_linklist}   60
    click element   ${brand_linklist}

Select option from the pop up
    [Arguments]    ${option}
    wait until element is visible   css:.qa-brand-${option}   60
    click element   css:.qa-brand-${option}

Add multiple brand URL as per index
    [Arguments]    ${option}
    wait until element is visible   (//input[@placeholder='example.com'])[${option}]   60
    wait until element is enabled   (//input[@placeholder='example.com'])[${option}]   60
    click element   (//input[@placeholder='example.com'])[${option}]
    Create random URL value for multiple brand addition     (//input[@placeholder='example.com'])[${option}]

Create random URL value for multiple brand addition
    [Arguments]    ${option}
    ${random_string} =    Generate Random String       15      [NUMBERS]
    ${generated_random_value}=    Catenate   ${random_string}.com
    input text   ${option}   ${generated_random_value}
    log to console      ${generated_random_value}

Enter contact name of contact person
    [Arguments]     ${contact}
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible   css:#contactName    60
    click element   css:#contactName
    input text  css:#contactName    ${contact}
    Press Keys   css:#contactName   ENTER

Click on tab under key data
    [Arguments]     ${tab_name}
    wait until element is not visible       ${loaderIcon}       60
    Generic.Scroll the page till        7000
    wait until element is visible     //p[normalize-space()='${tab_name}']//following-sibling::p     60
    ${count}=       get text        //p[normalize-space()='${tab_name}']//following-sibling::p
    log to console      key data: ${count}
    set global variable     ${count}
    click element       //p[normalize-space()='${tab_name}']//following-sibling::p

Click on i-icon of asset-overview tab
    wait until element is visible       css:.qa-dashboard-home-iIcon       60
    click element       css:.qa-dashboard-home-iIcon

Verify i-icon popup is visible
    wait until element is visible        css:.popover-content       60
    log to console      Yes,Pop-up is visible for i-icon content.

Hover over i-icon of reports tab
    wait until element is visible       css:.qa-technology-products-Iicon i     60
    Mouse over       css:.qa-technology-products-Iicon i

Verify hovering on i-icon shows message and compare it with
    [Arguments]     ${option}
    wait until element is visible       css:#technology-products-Iicon      60
    ${title_value}    Get Element Attribute     css:#technology-products-Iicon        title
    Log to console    Title is: ${title_value}
    should be equal     ${title_value}        ${option}

Choose options inside personal_details
    [Arguments]     ${option}
    Generic.Select parameter    ${option}

Click on tab under Technology Types
    [Arguments]     ${tab_name}
    wait until element is not visible       ${loaderIcon}       60
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    wait until element is visible     //p[normalize-space()='${tab_name}']//following-sibling::p     60
    ${count}=       get text        //p[normalize-space()='${tab_name}']//following-sibling::p
    log to console      Technology: ${count}
    set global variable     ${count}
    click element       //p[normalize-space()='${tab_name}']//following-sibling::p

Fetch the total count
    [Arguments]    ${data}
    wait until element is visible   ${Totalcount_field}      60
    ${text}=     get text   ${Totalcount_field}
    ${parts}    Split String    ${text}    ${data}
    ${total_count}    Get Substring    ${parts[1]}    3
    Log to console  Total counts are:${total_count}
    set global variable    ${total_count}

Verify that key_data is equals to total number of counts
    [Arguments]    ${option}
    should be equal      ${count}    ${total_count}
    log to console      The Key data of ${option} is equal to total counts in ${option}

Choose tabs under organization
    [Arguments]     ${option}
    wait until element is visible       css:#nav-${option}-tab     60
    click element       css:#nav-${option}-tab

Click on i-icon of system configuration tab
    wait until element is visible       css:#advance-search-add-technology-Iicon        60
    click element       css:#advance-search-add-technology-Iicon

Click on i-icon of industry under company financial information
    wait until element is visible       css:.qa-company-information-financial-industry      60
    click element       css:.qa-company-information-financial-industry

Click on link inside industry i-icon
    [Arguments]    ${link}
    Generic.click on the button link    ${link}
    sleep       ${yop_sleep}

Click on i-icon of company department
    wait until element is visible       css:.qa-company-department-Iicon        60
    click element       css:.qa-company-department-Iicon

Click on view added Departments list
    [Arguments]     ${option}
    Generic.click on the button link        ${option}

Click on action menu button of department
    wait until element is visible       css:#Team-Member-Actions        60
    click element       css:#Team-Member-Actions

Choose Add department from Action button options
    [Arguments]    ${option}
    Generic.click on the tab        ${option}

Click on i-icon of cost_center in department
    wait until element is visible       css:.qa-iIconSection-dept-cc        60
    click element       css:.qa-iIconSection-dept-cc

Click on cancel add department
    [Arguments]    ${option}
    wait until element is visible       css:.qa-${option}-department-modal        60
    wait until element is enabled       css:.qa-${option}-department-modal        60
    click element        css:.qa-${option}-department-modal
    sleep       ${search_sleep}
# option: add, close

Search by Department
    [Arguments]    ${option}
    wait until element is visible       css:thead tr       60
    wait until element is visible       ${dept_SearchBar}       60
    Clear Element Text      ${dept_SearchBar}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${dept_SearchBar}   ${option}
    wait until element is visible       css:thead tr       60

Click on three dots of Department list
    sleep       ${search_sleep}
    wait until element is visible   ${three_dots_dept}   60
    click element   ${three_dots_dept}

Choose option from three_dots of Department
    [Arguments]     ${option}
    Generic.Select other option from profile list       ${option}

Click on i-icon inside technology
    wait until element is visible       css:#technology-products-Iicon      60
    click element       css:#technology-products-Iicon

Click on i-icon inside network discovery
    wait until element is visible       css:.qa-iIconSection-network-discovery     60
    click element       css:.qa-iIconSection-network-discovery

Click on link inside Network_discovery i-icon
    wait until element is visible       css:a[title='Network Discovery']        60
    click element       css:a[title='Network Discovery']
    sleep       ${yop_sleep}