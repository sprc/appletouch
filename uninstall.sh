#!/bin/sh
echo ""
echo "Kernel is $(uname -s -r). Looking to see if already patched..."
echo ""
if ! [ -f /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.bak ]
then
	echo "appletouch.ko.bak not found in /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.bak."
	echo "No backup to revert to! Quitting."
else
	echo "Found appletouch.ko.bak for $(uname -s -r)."
	echo ""
	echo "Will execute the following:"

	echo "sudo cp /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.revert.bak"
	echo "sudo cp /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.bak /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko"
	
	echo ""

	while true
	do
		read -p "Do you wish to revert to appletouch.ko.bak? (Y/N): " answer
		case $answer in
			[yY]* ) break;;
			[nN]* )	echo "Quitting."; exit;;
			* )	echo "Enter Y or N.";;
		esac
	done

	sudo cp /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.revert.bak && sudo cp /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.bak /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko
fi
