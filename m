From: Christopher Taylor <chtaylo3@gmail.com>
Date: Sat, 13 Sep 2008 21:33:32 -0400
Subject: [Buildroot] gadget uevents not detected by udevmonitor
Message-ID: <2590773a0809131833r4fc274f0x43a442201b456200@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'e configured hotplug and netlink sockets in my kernel 2.6.24 config file
and I've insmoded g_serial.  When I run udevmonitor I'm not seeing uevents
when I plug in the usb cable to the usb device port.  I am however getting
the gadget serial messages:
gs_disconnect: Gadget Serial disconnected
gs_setup_complete: status error, status=0, actual-16, length=18
gs_disconnect: Gadget Serial disconnected
gs_set_config: gadget Serial configured, full speec CDC-ACM config

I'm 100% sure this is an error on my part when building everything, but I'm
not sure where.

My whole intent here is to get uevents into my application via a netlink
socket.  I have no intent of running udev, but I do intent on listening on
that the netlink socket just like udev does so I can tell immediately when a
usb event occurs.

Any advice would be appreciated.

-Chris
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080913/ce26ab83/attachment.htm 
