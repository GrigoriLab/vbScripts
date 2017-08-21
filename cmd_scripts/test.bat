@echo off
set UUID=4fa1f056-e78b-42dc-b5b8-27c20955084e
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox
echo ENTER=default
set /p uid="Enter UUID: "



VBoxManage.exe list vms

if not "%uid%" == "" (
set UUID=%uid%
) else (
echo Using default UUID: %UUID%
)


SET count=1
FOR /f "tokens=1-4" %%G IN ('VBoxManage.exe list vms') DO (call :subroutine "%%G")
GOTO :eof

:subroutine
 echo %count%:%1
 set /a count+=1
 GOTO :eof

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
echo ===========================================================================
echo ========== Virtual Machine backup started at %mydate%_%mytime% ===========
echo ===========================================================================
ping 127.0.0.1 -n 60 > nul
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
echo ===========================================================================
echo ========== Virtual Machine backup is finished at %mydate%_%mytime% ===========
echo ===========================================================================
pause

