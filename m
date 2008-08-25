From: Bussmann, Paul <Paul.Bussmann@technidata.com>
Date: Mon, 25 Aug 2008 10:01:18 +0200
Subject: [Buildroot] Linux Kernel 2.6.17 support in Buildroot
Message-ID: <1B0F60C9E236904CB364F9EF52E0AFD90241B20E@sma10.technidata-ag.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

first of all thank you for the great software that you are maintaining!

I am developing solutions using the "TRITON-LP" processor module from
KARO Electronics. (ARM Machine ID 190)
It is an Intel X-Scale PXA255 ARM/Embedded processor module. 

KARO electronics gave me a patched version of the Linux Kernel version
2.6.17, a RootFS image and a tool-chain to develop the solution.
With a debian-based glibc, I quickly ran out of flash space so I decided
to switch to Buildroot.

I got quite familiar with Buildroot and now I am trying to get it
running with my board.

Unfortunately, the current Linux Kernel does not support the Board and
adding support to it is much too difficult to me.
I was glad about the feature that a custom Kernel is selectable in the
Buildroot project configuration.
Concerning the Toolchain settings, it seems to be not possible to select
a custom version or version 2.6.17.

How can I test if Buildroot would create a correct Toolchain using Linux
2.6.17 instead of 2.6.26?

Best regards,
Paul



-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080825/30c0f48d/attachment.htm 
