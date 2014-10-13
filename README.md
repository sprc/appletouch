appletouch
==========

Linux kernel driver for Apple touchpads - 05 Powerbooks - 08 Macbooks. Newer devices use bcm5974.

This repo contains changes I helped get into 3.15. If you are on an older kernel and would like to try the patch early can git clone or download and extract it, then:

	make
	sudo rmmod appletouch
	sudo insmod appletouch.ko

This persists until reboot.

To semi-permenantly install, you can try the included shell script:

	sh install.sh

This persists until you install a new version of the kernel, in which case you'll need to rerun the script. (Getting a better permenant installation solution is on my to-do list.)
