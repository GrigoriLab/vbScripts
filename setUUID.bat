@echo off
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox

VBoxManage internalcommands sethduuid new-termin-disk1.vmdk 4fa1f056-e78b-42dc-b5b8-27c20955084e 
pause