From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Fri, 25 Mar 2011 16:37:13 -0400
Subject: [Buildroot] compiling with debug
Message-ID: <1D6034426110564DA0DEA9EE9793B38358178E106B@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to compile my libs with debug. I enabled BR2_ENABLE_DEBUG in the Buildroot menuconfig and left the default level at 2, but it didn't work.

> file libpthread-0.9.30.3.so
libpthread-0.9.30.3.so: ELF 32-bit LSB shared object, ARM, version 1 (SYSV), dynamically linked (uses shared libs), stripped

Is there place elsewhere to enable debug?

thanx
/carl
