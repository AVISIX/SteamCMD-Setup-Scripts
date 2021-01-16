@echo off 
cls 
title ARK Server 

set serverName=Fart Gaming
set password=lol420
set adminPassword=notlol420
set /A port=7777
set /A queryPort=27015
set /A playerCount = 16

echo Starting Server...
set path="%cd%\ShooterGame\Binaries\Win64\ShooterGameServer.exe"
start "" %path% TheIsland?listen?SessionName=%serverName%?ServerPassword=%password%?ServerAdminPassword=%adminPassword%?Port=%playerCount%?QueryPort=%queryPort%?MaxPlayers=%playerCount%
exit 0