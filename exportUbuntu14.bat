@echo off
set VM=ubuntu14
set BACKUP_DIR=C:\BackupVM
set REMOTE_DIR=Z:\localFolder\grigori

@this will mount \\local_network\folder to a disk (e.g Z:)
pushd \\local_network\folder

For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
echo ==============================================================================
echo ========== Virtual Machine backup is started at %mydate%_%mytime% ===========
echo ==============================================================================
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox
echo Please wait...
ping 127.0.0.1 -n 10 > nul
VBoxManage controlvm %VM% poweroff soft
vboxmanage export %VM% -o "%REMOTE_DIR%\%VM%_%mydate%_%mytime%.ova"
For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
echo ==============================================================================
echo ========== Virtual Machine backup is finished at %mydate%_%mytime% ==========
echo ==============================================================================

popd

pause


