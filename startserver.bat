@echo off
title PZ Dedicated Server

Rem AUTOMATICALLY DETECTS IPV4 ON THE HOST MACHINE
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
echo Network IP: %NetworkIP%

Rem SET THE RCON PORT HERE, THIS SHOULD MATCH THE RCON PORT FOR THE SERVER
set Port=

Rem SET THE RCON PASSWORD HERE, THIS SHOULD MATCH THE RCON PASSWORD FOR THE SERVER
set Password=

echo (%time%) Script started.

:start

echo (%time%) Server starting.

start StartServer64.bat

echo (%time%) Server started.
echo (%time%) Initializing.

echo (%time%) Buffer for 20.
timeout /t 45
echo (%time%) Buffer over.

echo (%time%) Buffer for 20.
timeout /t 45
echo (%time%) Buffer over.

timeout /t 1800

echo (%time%) Save 1.
save.bat %NetworkIP%:%Port% %Password%

timeout /t 1800

echo (%time%) Save 2.
save.bat %NetworkIP%:%Port% %Password%

timeout /t 1800

echo (%time%) Save 3.
save.bat %NetworkIP%:%Port% %Password%

timeout /t 1800

echo (%time%) Save 4.
save.bat %NetworkIP%:%Port% %Password%

timeout /t 1800

echo (%time%) Save 5.
echo (%time%) 30 minute mark.
save.bat %NetworkIP%:%Port% %Password%

timeout /t 1200

echo (%time%) Save 6.
echo (%time%) 10 minute mark.
save.bat %NetworkIP%:%Port% %Password%
rcon -a %NetworkIP%:%Port% -p %Password% "servermsg \"10 minutes until reboot.\""

timeout /t 300

echo (%time%) Save 7.
echo (%time%) 5 minute mark.
save.bat %NetworkIP%:%Port% %Password%
rcon -a %NetworkIP%:%Port% -p %Password% "servermsg \"5 minutes until reboot.\""

timeout /t 240

echo (%time%) Save 8.
echo (%time%) 1 minute mark.
save.bat %NetworkIP%:%Port% %Password%
rcon -a %NetworkIP%:%Port% -p %Password% "servermsg \"1 minute until reboot.\""

timeout /t 50

echo (%time%) Save 9.
echo (%time%) 10 second mark.
save.bat %NetworkIP%:%Port% %Password%
rcon -a %NetworkIP%:%Port% -p %Password% "servermsg \"10 seconds until reboot.\""

timeout /t 10

echo (%time%) Reboot initializing.
save.bat %NetworkIP%:%Port% %Password%
rcon -a %NetworkIP%:%Port% -p %Password% "servermsg \"Reboot starting.\""
rcon -a %NetworkIP%:%Port% -p %Password% "quit"

echo (%time%) 20 second buffer.
timeout /t 20
echo (%time%) Buffer over.

echo (%time%) Killing old server window.
taskkill /im StartServer64.bat /f
echo (%time%) Killed.

echo (%time%) Looping.
goto start

echo (%time%) WARNING: server closed or crashed. Manual restart required.
