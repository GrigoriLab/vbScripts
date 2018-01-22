@echo off
set machine=64239e4
for /f "skip=3" %%G IN ('vagrant status %machine% --machine-readable') DO if not defined res set "res=%%G"
rem echo %res%

call :parse "%res%"
goto :eof

:parse
setlocal
set line=%~1
rem echo line = %line%
for /F "tokens=1* delims=," %%f in ("%line%") do (
	if "%%f" == "running" call :vagrantSSH 
	if "%%f" == "saved" call :vagrantUp 
	if "%%f" == "poweroff" call :vagrantUp
    if not "%%g" == "" call :parse "%%g"
)
endlocal
goto :eof

:vagrantSSH
vagrant ssh %machine%
exit

:vagrantUP
vagrant up %machine%
call :vagrantSSH
exit

:eof
exit

