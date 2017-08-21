@echo off
set "str=4567:abcde"
echo %str%
set "var1=%str::="^&REM #%
set "var2=%str:*:=%"
echo var1=%var1% var2=%var2%