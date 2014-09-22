From: Sylvain LG <forum@sylvainlegourr.com>
Date: Mon, 22 Sep 2014 20:46:16 +0200
Subject: [Buildroot] where is libdns_sd.so?
Message-ID: <CAK9TtU2BUcZpPVnvGAsYXShYr+ctAR-g2k3KLXgGG_kALPBNMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've just compiled my system with target package Avahi:

[*] avahi
[*]   IPv4LL network address configuration daemon
[*]   mDNS/DNS-SD daemon

I need libdns_sd.so to develop a zeroconf application.

But no such a lib is compiled altough a *find ./output -name *dns_sd**
displays:

./build/avahi-0.6.31/avahi-compat-libdns_sd
> ./build/avahi-0.6.31/avahi-compat-libdns_sd/dns_sd.h
> ./build/avahi-0.6.31/avahi-compat-libdns_sd.pc.in


What should I do?

Regards,

Sylvain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140922/f40f88f0/attachment.html>
