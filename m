From: Sam Nazarko <samnazarko@stmteam.com>
Date: Sat, 6 Aug 2011 01:51:57 +0100
Subject: [Buildroot] Still cannot get a booting system
Message-ID: <000501cc53d3$0ae00480$20a00d80$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't get what is necessary to just get a basic system booting on an i386
machine. Seems like it's not possible. I had success with ucLibc on 2011.02,
but can't get anything to work on 2011.05. Even when using the default
kernel in 2011.02, no dice. I've looked at everything, like building the
kernel from 2011.02 release and combining with the tarFS of a 2011.05 gcLibc
build (using same kernel headers of course) but no dice. It hangs on the
initialisation of USB:

 

Initializing random number generator... done.

Starting network...

                ip used greatest stack depth: 6088 bytes left

                usb 1-1: new full speed USB device using ohci_hcd and
address 2

                usb 1-1: New USB device found, idVendor=80ee, idProduct=0021

                usb 1-1: New USB device strings: Mfr=1, Product=3,
SerialNumber=0

                usb 1-1: Product: USB Tablet

                usb 1-1: Manufacturer: VirtualBox

                input: VirtualBox USB Tablet as
/devices/pci0000:00/0000:00:06.0/usb1-1/1-1:1.0/input/input4

                generic usb 003:80EE:0021.001: input, hidraw0, USB HID
V1.1.0 Mouse [VirtualBox USB Tablet} on usb-0000:00:06.0-1/input0

 

Although for all I know it's something happening after this. I can't seem to
resolve this issue. It exists outside of Virtualbox too, and will just give
me the same message. Tried both 2011.02 and 2011.05 default kernels with an
i386 defconfig to no joy. Suggestions?

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110806/a95a4a43/attachment-0001.html>
