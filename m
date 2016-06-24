From: Patrick Doyle <wpdster@gmail.com>
Date: Fri, 24 Jun 2016 16:14:39 -0400
Subject: [Buildroot] USB network gadget
Message-ID: <CAF_dkJCHdmQxuzTR=V9NGXU8VoATRchDQOogub5ahDauR4MDqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I know this is the wrong list, but folks who might know the answer to
this like to hang out here, so I'll ask.

I have an Edison board which has been configured to use the usb0 network gadget.

The problem is, I want to use this board as a USB host, and connect to
it from my (buildroot generated rootfs based -- there, now you see the
connection!) device.  And I want my device to show up as a usb0
network device on the Edison board, the same way it does when I plug
it into my Linux desktop.

Does anybody know how to change the usb0 network device from a USB
"device" type of device to a USB "host" type of device?  Where should
I start looking?

Thanks for any tips you can provide...

--wpd
