@echo off
set VM=ubuntu14
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox

FOR /f "tokens=*" %%G IN ('VBoxManage.exe list vms ^|find "%VM%"') DO (call :subroutine "%%G")
GOTO :eof

:subroutine
 set str=%~1
 set "name=%str: ="^&REM #%
 set "uuid=%str:* =%"
 echo ******************Found VM******************
 echo Name: %name%
 echo UUID: %uuid%
 echo ********************************************
 VBoxManage controlvm %uuid% savestate
 GOTO :eof
