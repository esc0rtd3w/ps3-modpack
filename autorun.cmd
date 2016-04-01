@echo off


mode con lines=33



:mainps3
set auto=0


:: Setting Downgrade Success Flag to "0".
:: This will prevent a false downgrade selection
set dgsuccess=0
set downgrade=0
set remarry=0

set ofw=0
set cfw=0

set pack=data\bin\rar.exe a -ep -ep1 -y -m5
set unpack=data\bin\rar.exe x -y

set fwPath=%cd%\PS3\UPDATE
set updatePUPRestore="%fwPath%\PS3UPDAT.PUP"
set updatePUPUse=PS3UPDAT.PUP

set modPath=%cd%\PS3\MODPACK

set install=0
set restore=0

set dgStatus=0

color 0e

title PS3 Modpack v1.8 [USB Edition]                  esc0rtd3w 2016 / crackacademy.com

:: OLD OPTIONS
::echo 1) Complete PS3 Mod (Automatically Save Destination USB Drive Letter)
::echo 2) Complete PS3 Mod (Always Ask For Destination USB Drive Letter)
::echo 3) Choose Which Components To Run

cls
echo -------------------------------------------------------------------------------
echo PS3 Modding Script :: Main Menu
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo Please select an option below:
echo.
echo.
echo 1) Downgrade Console
echo.
echo 2) Custom Firmware
echo.
echo 3) Original Firmware
echo.
echo 4) Install Packages
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo X) Exit
echo.
echo.

choice /c 1234x /n

if errorlevel 5 goto end
if errorlevel 4 goto mainps3
if errorlevel 3 goto mainps3
if errorlevel 2 goto mainps3
if errorlevel 1 goto dgMain

goto mainps3


:dgMain

cls
echo -------------------------------------------------------------------------------
echo PS3 Modding Script :: Downgrade Console
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo Please select an option below:
echo.
echo.
echo 1) Prepare and Install MLT 6.66 NoBD PUP
echo.
echo 2) Prepare and Install ToggleQA Package
echo.
echo 3) Prepare and Install Rogero 9.99 NoBD PUP
echo.
echo 4) Prepare and Install 3.55 OFW PUP
echo.
echo.
echo 5) Choose A Downgrade Firmware To Install
echo.
echo 6) Check Minimum Version of Target PS3 Console
echo.
echo.
echo.
echo B) Back
echo.
echo X) Exit
echo.
echo.

choice /c 123456bx /n

if errorlevel 8 goto end
if errorlevel 7 goto mainps3
if errorlevel 6 goto dgMinCheck
if errorlevel 5 goto dgCFW1
if errorlevel 4 goto dgStep4
if errorlevel 3 goto dgStep3
if errorlevel 2 goto dgStep2
if errorlevel 1 goto dgStep1

goto dgMain


:dgStep1
set dgStatus=6.66 MLT PUP
set install=ren "%fwPath%\6.66-mlt-downgrader-nobd.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 6.66-mlt-downgrader-nobd.PUP
goto dgProcess


:dgStep2
cls
echo -------------------------------------------------------------------------------
echo PS3 Modding Script :: Downgrade Console :: Toggle QA
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo Please Insert The USB Flash Drive Into The Far Right Port On PS3 Console
echo.
echo.
echo.
echo Install The "toggleQA.pkg" File On The Console [Packages]
echo.
echo The PS3 Will Reboot and Beep 3 Times If Successful
echo.
echo If It Does Not Reboot and Beep 3 Times, Try Again Until It Does
echo.
echo.
echo After Reboot, Navigate To Settings Column and Highlight Network Settings
echo.
echo Push The Following Buttons At The Same Time: L1+L2+R1+R2+L3+DPAD_DOWN
echo.
echo There Will Be 3 New Options, If This Does Not Happen, Relaunch "Toggle QA"
echo.
echo.
echo.
echo.
echo *WHEN FINISHED, PLUG USB DRIVE BACK INTO COMPUTER*
echo.
echo.
echo Press ENTER When You Are Ready To Proceed To The Next Step....
echo.
echo.
pause>nul
goto dgMain


:dgStep3
set dgStatus=9.99 Rogero PUP
set install=ren "%fwPath%\9.99-downgrader-rogero.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 9.99-downgrader-rogero.PUP
goto dgProcess


:dgStep4
set dgStatus=3.55 OFW PUP
set install=ren "%fwPath%\3.55-ofw-cex.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 3.55-ofw-cex.PUP
goto dgProcess


:pkgInstall


goto pkgInstall


:dgProcess

%install%

cls
echo -------------------------------------------------------------------------------
echo PS3 Modding Script :: Downgrade Console :: %dgStatus%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo Please Insert The USB Flash Drive Into The Far Right Port On PS3 Console
echo.
echo.
echo.
echo.
echo *WHEN FINISHED, PLUG USB DRIVE BACK INTO COMPUTER*
echo.
echo.
echo Press ENTER When You Are Ready To Proceed To The Next Step....
echo.
pause>nul

%restore%

goto dgMain


:dgCFW1

cls
echo -------------------------------------------------------------------------------
echo PS3 Modding Script :: Downgrade Console :: Firmware Select :: Page 1
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo Please select a custom firmware from below:
echo.
echo.
echo 1) 3.15-downgrader-retail-cex.PUP
echo.
echo 2) 3.40-reverter-sex2cex.PUP (Kiosk To Retail)
echo.
echo 3) 3.41-downgrader-retail-cex.PUP
echo.
echo 4) 3.55-downgrader-debug-dex.PUP
echo.
echo 5) 3.55-downgrader-retail-cex.PUP
echo.
echo 6) 3.55-downgrader-shop-sex2cex.PUP (Kiosk To Retail)
echo.
echo 7) 3.55-reverter-sex2cex.PUP (Kiosk To Retail)
echo.
echo.
echo.
echo N) Next Page
echo.
echo B) Back
echo.
echo.

choice /c 1234567nb /n

if errorlevel 9 goto dgMain
if errorlevel 8 goto dgCFW2
if errorlevel 7 goto dgPup7
if errorlevel 6 goto dgPup6
if errorlevel 5 goto dgPup5
if errorlevel 4 goto dgPup4
if errorlevel 3 goto dgPup3
if errorlevel 2 goto dgPup2
if errorlevel 1 goto dgPup1

goto dgCFW1


:dgCFW2

cls
echo -------------------------------------------------------------------------------
echo PS3 Modding Script :: Downgrade Console :: Firmware Select :: Page 2
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo Please select a custom firmware from below:
echo.
echo.
echo 1) 3.55-rogero-downgrader-cex-nobd-nobt.PUP
echo.
echo 2) 4.20-downgrader-retail-dex.PUP
echo.
echo 3) 4.25-downgrader-rogero-3.7a.PUP
echo.
echo 4) 4.xx-downgrader-rogero.PUP
echo.
echo 5) 6.66-mlt-downgrader-nobd.PUP
echo.
echo 6) 9.99-downgrader-habib.PUP
echo.
echo 7) 9.99-downgrader-mlt.PUP
echo.
echo.
echo.
echo N) Next Page
echo.
echo B) Back
echo.
echo.

choice /c 1234567nb /n

if errorlevel 9 goto dgCFW1
if errorlevel 8 goto dgCFW3
if errorlevel 7 goto dgPup14
if errorlevel 6 goto dgPup13
if errorlevel 5 goto dgPup12
if errorlevel 4 goto dgPup11
if errorlevel 3 goto dgPup10
if errorlevel 2 goto dgPup9
if errorlevel 1 goto dgPup8

goto dgCFW2


:dgCFW3

cls
echo -------------------------------------------------------------------------------
echo PS3 Modding Script :: Downgrade Console :: Firmware Select :: Page 3
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo Please select a custom firmware from below:
echo.
echo.
echo 1) 9.99-downgrader-rebug.PUP
echo.
echo 2) 9.99-downgrader-rogero.PUP
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo B) Back
echo.
echo X) Exit
echo.
echo.

choice /c 12bx /n

if errorlevel 4 goto end
if errorlevel 3 goto dgCFW2
if errorlevel 2 goto dgPup16
if errorlevel 1 goto dgPup15

goto dgCFW3


:dgPup1
set dgStatus=3.15 Downgrade Retail CEX
set install=ren "%fwPath%\3.15-downgrader-retail-cex.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 3.15-downgrader-retail-cex.PUP
goto dgProcess

:dgPup2
set dgStatus=3.15 Downgrade Retail CEX
set install=ren "%fwPath%\3.40-reverter-sex2cex.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 3.40-reverter-sex2cex.PUP
goto dgProcess

:dgPup3
set dgStatus=3.41 Downgrade Retail CEX
set install=ren "%fwPath%\3.41-downgrader-retail-cex.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 3.41-downgrader-retail-cex.PUP
goto dgProcess

:dgPup4
set dgStatus=3.55 Downgrade Debug DEX
set install=ren "%fwPath%\3.55-downgrader-debug-dex.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 3.55-downgrader-debug-dex.PUP
goto dgProcess

:dgPup5
set dgStatus=3.55 Downgrade Retail CEX
set install=ren "%fwPath%\3.55-downgrader-retail-cex.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 3.55-downgrader-retail-cex.PUP
goto dgProcess

:dgPup6
set dgStatus=3.55 Downgrade Kiosk SEX To CEX
set install=ren "%fwPath%\3.55-downgrader-shop-sex2cex.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 3.55-downgrader-shop-sex2cex.PUP
goto dgProcess

:dgPup7
set dgStatus=3.55 Reverter Kiosk SEX To CEX
set install=ren "%fwPath%\3.55-reverter-sex2cex.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 3.55-reverter-sex2cex.PUP
goto dgProcess

:: 1 on Page 2
:dgPup8
set dgStatus=3.55 Downgrade CEX NoBD/NoBT
set install=ren "%fwPath%\3.55-rogero-downgrader-cex-nobd-nobt.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 3.55-rogero-downgrader-cex-nobd-nobt.PUP
goto dgProcess

:dgPup9
set dgStatus=4.20 Downgrade Retail/Debug CEX/DEX
set install=ren "%fwPath%\4.20-downgrader-retail-dex.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 4.20-downgrader-retail-dex.PUP
goto dgProcess

:dgPup10
set dgStatus=4.25 Downgrade Rogero 3.7a
set install=ren "%fwPath%\4.25-downgrader-rogero-3.7a.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 4.25-downgrader-rogero-3.7a.PUP
goto dgProcess

:dgPup11
set dgStatus=4.xx Downgrade Rogero
set install=ren "%fwPath%\4.xx-downgrader-rogero.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 4.xx-downgrader-rogero.PUP
goto dgProcess

:dgPup12
set dgStatus=6.66 Downgrade MLT NoBD
set install=ren "%fwPath%\6.66-mlt-downgrader-nobd.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 6.66-mlt-downgrader-nobd.PUP
goto dgProcess

:dgPup13
set dgStatus=9.99 Downgrade Habib
set install=ren "%fwPath%\9.99-downgrader-habib.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 9.99-downgrader-habib.PUP
goto dgProcess

:: 7 on Page 2
:dgPup14
set dgStatus=9.99 Downgrade MLT
set install=ren "%fwPath%\9.99-downgrader-mlt.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 9.99-downgrader-mlt.PUP
goto dgProcess


:: 1 on Page 3
:dgPup15
set dgStatus=9.99 Downgrade Rebug
set install=ren "%fwPath%\9.99-downgrader-rebug.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 9.99-downgrader-rebug.PUP
goto dgProcess

:dgPup16
set dgStatus=9.99 Downgrade Rogero
set install=ren "%fwPath%\9.99-downgrader-rogero.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% 9.99-downgrader-rogero.PUP
goto dgProcess

:dgMinCheck
set dgStatus=Minimum Version Checker PUP
set install=ren "%fwPath%\minverchk.PUP" %updatePUPUse%
set restore=ren %updatePUPRestore% minverchk.PUP
goto dgProcess


:end
exit






