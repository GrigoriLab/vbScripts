@echo off
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox
vboxmanage clonehd "termin-disk1.vmdk" "new-termin-disk1_vmdk.vdi" --format vdi
vboxmanage modifyhd "new-termin-disk1_vmdk.vdi" --resize 30720
VBoxManage clonehd "new-termin-disk1_vmdk.vdi" "new-termin-disk1.vmdk" --format vmdk
pause