*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${emulator}    none
${URL}         https://www.google.nl/
@{browser}     chrome    firefox
${SSDIR}       ${EXECDIR}\\Screenshots

*** Keywords ***

Test Suite Setup Switch
    Run Keyword If    '${emulator}' == 'none'    Test Suite Setup Longer Timeout
    ...    ELSE        Test Setup Mobile Emulator Device Preset    ${emulator}

Test Suite Setup
    Log    Starting Robotframework testsuite for Aquasim
    Open Browser  ${url}    ${browser}[0]
    Maximize Browser Window
    Set Screenshot Directory    EMBED
    Set Selenium Implicit Wait    10 seconds
    Set Selenium Timeout          180 seconds
    Login
    
Test Suite Setup Longer Timeout
    Log    Starting Robotframework testsuite for Aquasim
    Open Browser  ${url}    ${browser}[0]
    Maximize Browser Window
    Set Screenshot Directory    EMBED
    Set Selenium Implicit Wait    30 seconds
    Set Selenium Timeout          180 seconds
    Login

Test Setup
    Log    Start Testcase: ${TEST NAME}
     
Test Setup Mobile Emulator Device Preset
    [Arguments]    ${deviceName}
    ${mobile emulation}=    Create Dictionary    deviceName=${deviceName}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    Create Webdriver    Chrome    chrome_options=${chrome options}   
    Go To                         ${url}
    Set Screenshot Directory      EMBED
    Set Selenium Implicit Wait    90 seconds
    Set Selenium Timeout          180 seconds
    
Test Setup Mobile Emulator Device Metrics
    [Arguments]    ${devicewidth}    ${deviceheight}    ${devicepixelration}    
    ${device metrics}=    Create Dictionary    width=${devicewidth}     height=${deviceheight}     pixelRatio=${devicepixelration}    userAgent=Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19
    ${mobile emulation}=    Create Dictionary    deviceMetrics=${device metrics}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Go To                         ${url}
    Set Screenshot Directory      EMBED
    Set Selenium Implicit Wait    90 seconds
    Set Selenium Timeout          180 seconds
    
Test Teardown
    Log     End Testcase: ${TEST NAME}
    
Test Suite Teardown
    Log    Ending Robotframework testsuite for Aquasim
    Close Browser