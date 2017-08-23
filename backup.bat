@echo off
REM place this file in the same folder where is the vm (e.g. my vm folder is "C:\Users\grigori\VirtualBox VMs\ubuntu14", so I should paste this bat in "C:\Users\grigori\VirtualBox VMs")
set VM_FOLDER_NAME=ubuntu14
set VM=%VM_FOLDER_NAME%
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox
For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
echo ==============================================================================
echo ========== Virtual Machine backup is started at %mydate%_%mytime% ===========
echo ==============================================================================

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
 echo Please wait...
 ping 127.0.0.1 -n 5 > nul
 md "backup %mydate%_%mytime%"
 cd %VM_FOLDER_NAME%
 xcopy ".\*" "..\backup %mydate%_%mytime%" /s /i /Z
 cd ..
 For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
 For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
 echo ==============================================================================
 echo ========== Virtual Machine backup is finished at %mydate%_%mytime% ==========
 echo ==============================================================================
 pause
 GOTO :eof

