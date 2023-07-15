@echo off
title Multipaper Node Server
setlocal enabledelayedexpansion
cd %~dp0
if not exist "multipaper.yml" (
	set /p server= IP and port of the master server: 
	echo !server! > server.txt
	set /p name= Node name: 
	echo !name! > name.txt
	set /p ram= GB of RAM: 
	echo !ram! > ram.txt
	echo %RANDOM% > port.txt

	:: Create shortcut
	start shortcut.bat
)
:: Load variables
set /p name=<name.txt
set name=!name: =!
set /p ram=<ram.txt
set ram=!ram: =!
set /p port=<port.txt
set port=!port: =!

::Add port mapping
java -jar portmapper-2.2.3.jar -add -externalPort !port! -internalPort !port! -protocol tcp -lib org.chris.portmapper.router.sbbi.SBBIRouterFactory -description minecraft
:: Start server
java -Xmx!ram!G -Dspigot.settings.bungeecord=true -DmultipaperMasterAddress=!server! -Dmultipaper.master-connection.my-name=!name! -Dcom.mojang.eula.agree=true -jar server.jar nogui --port !port!
pause
