From: daniele_dll <d.albano@gmail.com>
Date: Sat, 9 May 2009 16:56:01 +0200
Subject: [Buildroot] Buildroot and Thread Support for Toolchain:
	sysdep-cancel.h error
Message-ID: <159a01660905090756r2390f7bfgec9de71ad79d9831@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all,

i follow this mailing list from some time because i've tried in my
spare time to build a little x86 system for a old pentium 200mhz
without success. However, in these days, i got this stuff back because
i need to build a ppc405 base system for a university project.

After some errors and some googling i managed to build a root system
without threads and disabling libgomp and libssp on gcc and, actually,
without development tools on target too. Would be great have threads
(nptl or old linuxthreads) enabled because i can use them for my
project instead of fork in the code!

I'm actually using buildroot 2009.05-rc1, but i got the same problem
before with 2009.02, on a Ubuntu Jaunty 9.04 32bit. I get the error
simply setting up basilar parameters like architecture and cpu and
enabling thread support and leaving all the stuff on default values.
While it compile libpthread -> uclibc it print out the error message
saying that it can't found sysdep-cancel.h requested by
toolchain_build_powerpc/uClibc-0.9.30.1/libpthread/linuxthreads/sysdeps/pthread/errno-loc.c.

Has someone a solution to this problem? I tried to comment out, just
for a test, but without success because it is requested in another
file!


Thanks for the support and for this great project!
