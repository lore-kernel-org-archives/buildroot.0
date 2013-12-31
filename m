From: Thiyagarajan <thiyagu.bt@gmail.com>
Date: Tue, 31 Dec 2013 17:53:10 +0530
Subject: [Buildroot] error: Package requirements (xorg-server >= 1.4 xproto
 inputproto) were not met:
Message-ID: <CABsRcuAOLy=xpuDJUDc4Qh-WRgzWSK7GS1EZooxYa_8i8M5LeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build the xwindow system for my embedded project.
I tried with  modular X.org xserver
When i compile i am getting the following error


-- checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for /home/thiyagu/buildroot/output/host/usr/bin/ccache
/home/thiyagu/buildroot/output/host/usr/bin/i486-buildroot-linux-gnu-gcc
option to accept ISO C99... -std=gnu99
checking whether __clang__ is declared... no
checking whether __INTEL_COMPILER is declared... no
checking whether __SUNPRO_C is declared... no
checking pkg-config is at least version 0.9.0... yes
checking if /home/thiyagu/buildroot/output/host/usr/bin/ccache
/home/thiyagu/buildroot/output/host/usr/bin/i486-buildroot-linux-gnu-gcc
-std=gnu99 supports -Werror=attributes... no
checking for XORG... no
configure: error: Package requirements (xorg-server >= 1.4 xproto
inputproto) were not met:

Package xorg-server was not found in the pkg-config search path.
Perhaps you should add the directory containing `xorg-server.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xorg-server' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables XORG_CFLAGS
and XORG_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make: ***
[/home/thiyagu/buildroot/output/build/xdriver_xf86-input-keyboard-1.6.1/.stamp_configured]
Error 1

Help me to solve the error

B.Thiyagarajan.
GMRT-TIFR
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131231/729cfc15/attachment.html>
