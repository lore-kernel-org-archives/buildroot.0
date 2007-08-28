From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 28 Aug 2007 11:00:33 +0200
Subject: [Buildroot] BR fails to build native Toolchain for ARM
Message-ID: <vlg4M3cg8kYs.WS9Jk0yD@mailout.dof.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi all!

When using buildroot for arm, it fails to build a native toolchain with 
the following error:

/usr/lib/libgmp.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status

Config is gcc 4.2.1, binutils 2.17, uclibc 0.9.29
Build system is centos 5.

I tried various gcc versions in br, but every time got the same result.

=> I manage to build a
 toolchain with this settings.
 There are other settings 
 which can be configured.
 OABI, generic-arm, NWFPE
  is what I use.

Best Regards
Ulf Samuelsson
