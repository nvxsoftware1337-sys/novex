@echo off
mode con: cols=100 lines=40
title Serial Checker
echo **********************************
color 0F
echo **********************************
:start
cls
echo.
echo [36m^> [36m^CPU[37m
wmic cpu get serialnumber
echo.
echo [36m^> [36m^BIOS[37m
wmic bios get serialnumber
echo.
echo [36m^> [36m^Motherboard[37m
wmic baseboard get serialnumber
echo.
echo [36m^> [36m^BIOS UUID[37m
wmic path win32_computersystemproduct get uuid
echo.
echo [36m^> [36m^DISK[37m
wmic diskdrive get model, serialnumber
echo.
echo [36m^> [36m^MAC Address[37m
getmac
echo.
echo [36m^> [36m^TPM SERIAL[37m
echo Run as Administrator to view
powershell.exe -Command "(Get-TpmEndorsementKeyInfo -Hash Sha256).PublicKeyHash"
echo.
pause>nul
goto start
