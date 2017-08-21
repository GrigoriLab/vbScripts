@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
echo ==============================================================================
echo ========== Virtual Machine backup is started at %mydate%_%mytime% ===========
echo ==============================================================================
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox
VBoxManage controlvm {4fa1f056-e78b-42dc-b5b8-27c20955084e} savestate
echo Please wait...
ping 127.0.0.1 -n 10 > nul
md "backup %mydate%_%mytime%"
cd VM*
xcopy ".\*" "..\backup %mydate%_%mytime%" /s /i /Z
cd ..
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
echo ==============================================================================
echo ========== Virtual Machine backup is finished at %mydate%_%mytime% ==========
echo ==============================================================================
pause

