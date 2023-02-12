@Echo Off
Set "SExe="
Set "SPth="
For /F "Tokens=1,2*" %%A In ('Reg Query HKLM\SOFTWARE\WOW6432Node\Firaxis\Civilization5') Do (
    If "%%A" Equ "InstallPath" Set "SExe=%%C"
    If "%%A" Equ "UserPath" Set "SPth=%%C")
If Not Defined SExe Exit/B

echo " ___  _   _  _ __    ___  _ __  _ __    ___ __      __ ___  _ __  ___ "
echo "/ __|| | | || '_ \  / _ \| '__|| '_ \  / _ \\ \ /\ / // _ \| '__|/ __|" 
echo "\__ \| |_| || |_) ||  __/| |   | |_) || (_) |\ V  V /|  __/| |   \__ \"
echo "|___/ \__,_|| .__/  \___||_|   | .__/  \___/  \_/\_/  \___||_|   |___/"
echo "            | |                | |                                    "
echo "            |_|                |_|                                    "
echo.
echo 		      PRE-REQUISITES INSTALLER
echo.
echo This will install the pre-requisites required for SUPERPOWERS
echo It includes a custom version of EnhancedUI by BC1 and Main Menu Replacer by Sukritract
echo Join the Discord if you face any issues: https://discord.gg/CtwmyXbttw
echo.
echo.
echo.
Echo=The Pre-Reqs will be installed here: %SExe%\Assets\DLC
echo.
Echo=The Civ5 Cache will be cleared here: %SPth%\My Games\Sid Meier's Civilization 5\Cache
echo.
pause

Rem The following commands clean and install the pre-requisites required for SUPERPOWERS

::Clean the DLC folder
rmdir /s /q "%SExe%\Assets\DLC\UI_bc1"
rmdir /s /q "%SExe%\Assets\DLC\UI_MainMenu"

::Copy mods to the DLC folder
xcopy /s /i "Core" "%SExe%\Assets\DLC"

echo.
echo "Pre-Requisites installed to Civ 5 Directory\Assets\DLC"
echo.

::Clear the cache
rmdir /s /q "%SPth%\My Games\Sid Meier's Civilization 5\Cache"

echo.
echo Civ5 Cache has been cleared.
echo.
echo.

::Echo=The full path to the Civ5 executable is "%SExe%"
::If Defined SPth Echo=The Civ5 User Data path is "%SPth%"

::SUPERPOWERS Pre-Req Installer
::%APPDATA%\SUPERPOWERSInstaller
::%APPDATA%\SUPERPOWERSInstaller\PrereqInstaller.bat

pause
Timeout -1 1>Nul