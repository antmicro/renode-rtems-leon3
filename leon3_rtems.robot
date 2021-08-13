*** Settings ***
Suite Setup                   Setup
Suite Teardown                Teardown
Test Setup                    Reset Emulation
Test Teardown                 Test Teardown
Resource                      ${RENODEKEYWORDS}

*** Variables ***
${SCRIPT}                     ${CURDIR}/leon3_rtems.resc
${UART}                       sysbus.uart
${PROMPT}                     SHLL [/] # 

*** Keywords ***
Prepare Machine
    Execute Script            ${SCRIPT}

    Create Terminal Tester    ${UART}

*** Test Cases ***
Should Boot RTEMS
    [Documentation]           Boots RTEMS on the Leon3 platform.
    [Tags]                    rtems  uart
    Prepare Machine

    Start Emulation

    Wait For Prompt On Uart   ${PROMPT}

    Provides                  booted-rtems

Should Print System Information
    [Documentation]           Tests shell responsiveness in RTEMS on the Leon3 platform.
    [Tags]                    rtems  uart
    Requires                  booted-rtems

    Write Line To Uart        drvmgr
    Wait For Line On Uart     NO DEVICES FAILED TO INITIALIZE