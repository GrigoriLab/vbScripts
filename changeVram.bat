@echo off
set VM=ubuntu14
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox
VBoxManage modifyvm %VM%--vram 256
