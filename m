From: =?ISO-8859-1?Q?P=E9ter_St=F3sz?= <peter.stosz@mentat.hu>
Date: Tue, 25 May 2010 00:01:06 +0200
Subject: [Buildroot] USB Ethernet register too late
Message-ID: <AANLkTill0JXHnWN3zh5dhnxRb-hZqJpjPGOmdqSTzmTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I have a custom SAM9261 board and USB Ethernet (Davicom  DM9601) adapter.
(Kernels 2.6.30 and 2.6.33.2)
What can I do, to DM9601 register well and state goes up, before the
Ethernet(/IP) configuration started?

...
usbcore: registered new interface driver dm9601
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 20, io mem 0x00500000
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
i2c /dev entries driver
TCP cubic registered
usb 1-1: new full speed USB device using at91_ohci and address 2
IP-Config: No network devices available.
Looking up port of RPC 100003/2 on 10.11.1.102
eth0: register 'dm9601' at usb-at91-1, Davicom DM9601 USB Ethernet,
00:10:13:50:ae:e6
...

Peter
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100525/e9ce344d/attachment.html>
