From: Willy <willy@willygroup.org>
Date: Fri, 06 Jul 2012 13:17:38 +0200
Subject: [Buildroot] Barcode reader (rs232 + usb device) on buildroot
Message-ID: <jt6hgi$394$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've a barcode reader with RS232 and USB interfaces.
In my host pc with Ubuntu 10.04 64bit I use it in both way without 
problems.
in serial mode I retrieve the device at /dev/ttyS0
In USB mode (directly with USB or whit RS232/USB adaptor) I retrieve the 
device at /dev/ttyUSB0

With buildroot in serial mode I read the code (and some error strings, 
[probably a configuration error])
in USB mode I can't read anything: I don't have /dev/ttyUSB*

I think something is missing, but in buildroot and kernel configuration 
I can't figured out what is it... :(

Someone can give me an hint?

Thanks
-- 
Willy
