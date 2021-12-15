*** Settings ***
Resource    ../resources/keywordlibrarycommon.robot

Suite Setup        Test Suite Setup Switch
Test Setup         Test Setup
Test Teardown      Test Teardown
Suite Teardown     Test Suite Teardown

Default tags    Settings

*** Test Cases ***

Testcase 1 - Parameters
   Log		It's working!