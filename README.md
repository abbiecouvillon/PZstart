# PZstart
project zomboid dedocated reboot script, not recommended for use right off the bat but you can try, automated rcon saves and restarts

uses rcon client for windows: https://github.com/gorcon/rcon-cli/releases/tag/v0.10.1

# setup
get the rcon.exe and the batch scripts and put them in the directory. you should be overwriting the StartServer64.bat in the directory. 
If youre using another version, be sure to edit the StartServer32.bat or whatever one your using to have the line:
```
exit
```
at the end of it. Then change the line:
```
start StartServer64.bat
```
to:
```
start StartServer32.bat
```
or whatever bat youre running for the server.

Lastly, at the top it shows
```
set Port=
set Password=
```
make sure these match the values in yout .ini for the server or else it wont work. open an issue request if it doesnt work.
