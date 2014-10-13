#!/bin/sh
echo ""
echo "Kernel is $(uname -s -r). Looking to see if already patched..."
echo ""
if ! [ -f /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.bak ]
then
	echo "appletouch.ko.bak not found in /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.bak."
	echo "This script will create a backup of appletouch.ko and then compile and install a patched version."
	echo "You can undo this later by running uninstall.sh."
	echo ""
	echo "Will now string together the following commands:"
	echo ""
	echo "sudo cp /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.bak"
	echo "sudo make clean"
	echo "sudo make"
	echo "sudo cp appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko"
	echo "sudo rmmod appletouch"
	echo "sudo modprobe appletouch"
	echo ""

	while true
	do
		read -p "Run the script now? (Y/N): " answer
		case $answer in
			[yY]* ) break;;
			[nN]* )	echo "Quitting."; exit;;
			* )	echo "Enter Y or N.";;
		esac
	done

	echo ""
	echo "Executing: sudo cp /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.bak && sudo make clean && sudo make && sudo cp appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko && sudo rmmod appletouch && sudo modprobe appletouch"

	sudo cp /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko.bak && sudo make clean && sudo make && sudo cp appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko && sudo rmmod appletouch && sudo modprobe appletouch && echo "" && echo "Done!"

else
	echo "Already patched for $(uname -s -r)."
fi
