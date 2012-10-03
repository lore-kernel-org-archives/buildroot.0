From: =?ISO-8859-1?Q?Christian_M=F6ller?= <christian.moeller.75@googlemail.com>
Date: Wed, 3 Oct 2012 11:39:50 +0200
Subject: [Buildroot] eGalax Touchscreen
Message-ID: <CAA8O6f7aq+f95GQMLhLMx+4ystqCcj5JOMAnLDD01dQfRHU36g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all
I'm trying to setup EGalax Touchscreen. The controller-ic is an etr-4000
usb.
I patched the Kernel described in "eGTouch Linux Programming Guide v2.5c". (
http://home.eeti.com.tw/web20/eGalaxTouchDriver/linuxDriver.htm)
In dmesg output the controller is listet, but there is no /dev/uinput and
no /dev/hidrawX devicefile.
Device isn't also listet under /proc/bus/input/devices.
What I have to do to get the touchscreen running?
Any help will be welcome.
Best regards
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121003/f11f385e/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: devices.out
Type: application/octet-stream
Size: 1935 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121003/f11f385e/attachment-0004.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dmesg.out
Type: application/octet-stream
Size: 59838 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121003/f11f385e/attachment-0005.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 48769 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121003/f11f385e/attachment-0006.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 82226 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121003/f11f385e/attachment-0007.obj>
