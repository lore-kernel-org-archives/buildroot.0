From: cem akpolat <akpolatcem@gmail.com>
Date: Fri, 23 May 2014 16:10:52 +0200
Subject: [Buildroot] root password and dhcp
Message-ID: <CAMm5YqrLgFpGE4m2Mqi+KoSQtYv7O36A2w3DBtUy0p_uaVZdGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I have compiled a new file system via buildroot and modified the .cpio
according to my requirements, then repack it and run with the linux kernel.

My first question how can I access via ssh without root password? For
instance in openwrt file system, it is possible to access firstly through
telnet, if required, you can assign a password after the telnet connection.
Does buildroot provide the same functionality?

Secondly, it seems that the dhcp doesn't work well, because even though the
users connected to hostapd (I can see the messages), the assignment of the
ip doesn't take place. What could be possible issue here? I am using dnsmaq
and dhcp packages and all configurations are defined actually in
dnsmasq.conf.

Here is the configuration file content:

dhcp-leasefile=/var/tmp/dnsmasq.leases
dhcp-range=wlan0,192.168.126.10,192.168.126.250,1m
resolv-file=/etc/resolv.dnsmasq.conf


Thanks,

Cem Akpolat
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140523/f36c5a11/attachment.html>
