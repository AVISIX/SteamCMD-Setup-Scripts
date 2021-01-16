:: ****** ARK SERVER SETUP CONFIG ******
:: ServerTypes:
:: - 376030 (Survival Evolved)
:: - 445400 (Survival of The Fittest)
:: *************************************
set /A serverType=376030




@echo off 
cls 
title ARK Server Setup 

echo (%time%) Starting Setup...

echo Searching for Shortcut ...
IF EXIST "%cd%\steamcmd.exe.lnk" (
    set path="%cd%\steamcmd.exe.lnk"
    GOTO Setup
)
IF EXIST "%cd%\steamcmd.exe - Shortcut.lnk" (
    set path="%cd%\steamcmd.exe - Shortcut.lnk"
    GOTO Setup
)
echo No Shortcut found.

echo Searching for executable ...
IF EXIST "%cd%\Steam CMD\steamcmd.exe" (
    set path="%cd%\Steam CMD\steamcmd.exe"
    GOTO Setup  
)
echo No executable found.

echo (%time%) Setup failed, Steamcmd not found.
pause 
exit 0




:Setup 
    echo SteamCmd Found, starting setup (%path%)...
    
    if %serverType% == 376030 (
        set folderName="ARK (Survival Evolved)"

        if not exist "%cd%\ARK (SE)" (
            echo ARK Survival Evolved setup starting ...
            mkdir "%cd%\ARK (SE)" 
        ) else ( 
            echo Updating ARK Survival Evolved Server ... 
        )
    ) else if %serverType% == 445400 ( 
        set folderName="ARK (Survival of The Fittest)"

        echo ARK Survival of The Fittest setup starting ...

        if not exist "%cd%\ARK (SOTF)" (
            echo ARK Survival of The Fittest setup starting ...
            mkdir "%cd%\ARK (SOTF)" 
        ) else ( 
            echo Updating ARK Survival Evolved Server ... 
        )
    ) else ( echo Invalid Server Type. )

    start "" %path% +login anonymous +force_install_dir %cd%/%folderName%/ +app_update %serverType% +quit
exit 0