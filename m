From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 22:01:40 +0200
Subject: [Buildroot] OpenGL issues affecting the autobuilders
Message-ID: <20140512220140.5fe69970@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

There are currently several OpenGL issues affecting the autobuilders.
It would be nice if you could have a look at them.

With the RPi OpenGL implementation
==================================

Cairo fails to build, see
http://autobuild.buildroot.org/results/285/2851069d6964aa46d26b4aabe7d84e8c0c6c72ce/build-end.log.
Error is:

  fatal error: vcos_platform_types.h: No such file or directory

With the MESA OpenGL implementation
===================================

Pango fails to build, see
http://autobuild.buildroot.org/results/23f/23f1178838e32832b24354ba99dbb7b53763291c/build-end.log.
Error is:

/home/test/test/1/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/libGLESv2.so: undefined reference to `_glapi_get_dispatch'
/home/test/test/1/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/libGLESv2.so: undefined reference to `_glapi_Dispatch'

This issue was already discussed on the list, but I don't remember if a
patch was sent for it.

It would be nice to fix these issues in the near future.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
