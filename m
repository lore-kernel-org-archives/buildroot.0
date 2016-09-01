From: Adrian May <adrian.alexander.may@gmail.com>
Date: Thu, 1 Sep 2016 21:52:44 +0100
Subject: [Buildroot] Dial pppoe with buildroot on raspberry pi
Message-ID: <CAD-UbzFukjpnigepni-+arRi5h-KMo4d237=pryPvbZnoZ310g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm trying to make a wireless AP/router out of a rasberry pi using
buildroot.

I got the wifi working on the pi with hostapd and dnsmasq.

My Ubuntu box can successfully dial over my BT Openreach FTTC modem using
pppoeconf.

My problem is figuring out how to make buildroot dial over that modem. I
don't know where to begin. I enabled everything in menuconfig and
linux-menuconfig that sounded vaguely related to ppp, but there's no
equivalent of pppoeconf and the config files that showed up don't look a
bit like those on the ubuntu box. There are some noises about rp-pppoe and
a kernel module but they don't really fit together.

What's the proper procedure for a basic pppoe dial?

TIA,
Adrian.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160901/bac3f09f/attachment.html>
