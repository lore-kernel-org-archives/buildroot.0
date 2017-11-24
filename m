From: Roy Arav <roy.arav@shieldiot.io>
Date: Fri, 24 Nov 2017 07:05:48 +0200
Subject: [Buildroot] Static IP
Message-ID: <CAM27=5g_TOTu__LdjWcUKaMUiLtBxXD-t2g2N9VEx5JN69ZYUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to set static IP on a raspberry pi3 device running buildroot.

I edited /etc/network/interfaces, using rootfs overlay.


auto eth0
allow-hotplug eth0
iface eth0 inet static
address 192.168.0.1
netmask 255.255.255.0

And still IP address is provided using DHCP/

Is there anything else to so that I am missing?
Perhaps a BR2 flag or package that I need to enable?

Thanks
Roy
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171124/22d4d2da/attachment.html>
