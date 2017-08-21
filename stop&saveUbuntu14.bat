@echo off
set VM=ubuntu14
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox

FOR /f "tokens=*" %%G IN ('VBoxManage.exe list vms ^|find "%VM%"') DO (call :subroutine "%%G")
GOTO :eof

:subroutine
 set str=%~1
 set "var1=%str: ="^&REM #%
 set "var2=%str:* =%"
 echo ******************Found VM******************
 echo Name: %var1%
 echo UUID: %var2%
 echo ********************************************
 set UUID=%var2%
 VBoxManage controlvm %UUID% savestate
 GOTO :eof