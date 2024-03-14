*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://automationexercise.com

*** Test Cases ***
Example Test
    Launch Browser
    Navigate To Page    ${URL}
    Click On Products
    Click On Header
    Verify Search Input Present
    Input Text Into Search    Men Tshirt
    Click Search Button
    #Verify Products Visible
    #Add Product to Cart
    #Input Text Into Search    men t shirt
    #Click Search Button
    #Add Product to Cart
    #Click on Cart
    #Verify Cart Quantity    2

*** Keywords ***
Launch Browser
    Open Browser    ${URL}    Chrome

Navigate To Page
    [Arguments]    ${url}
    Go To    ${url}

Click On Products
    Click Element    xpath://a[contains(text(), 'Products')]

Click On Header
    ${header_element}=    Get WebElements    xpath://*[@name='advertisement']
    Run Keyword If    "${header_element}" != "[]"    Click Element At Coordinates    ${header_element}[0]    0    0
    ...    ELSE    Log    Header element not found.

Verify Search Input Present
    Wait Until Element Is Visible    id:search_product
    Page Should Contain Element    id:search_product

Input Text Into Search
    [Arguments]    ${text}
    Input Text    id:search_product    ${text}

Click Search Button
    Click Element    xpath://button[@type='submit']

Verify Products Visible
    Wait Until Page Contains Element    xpath://div[contains(@class, 'product')]

Add Product to Cart
    Click Element    xpath://button[contains(text(), 'Add to cart')]

Click on Cart
    Click Element    xpath://a[contains(text(), 'Cart')]

Verify Cart Quantity
    [Arguments]    ${expected_quantity}
    Wait Until Element Is Visible    xpath://span[@id='cart_quantity' and contains(text(), '${expected_quantity}')]
