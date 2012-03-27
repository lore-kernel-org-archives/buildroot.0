From: Dimitry Golubovsky <golubovsky@gmail.com>
Date: Mon, 26 Mar 2012 22:09:12 -0400
Subject: [Buildroot] Cannot build modular X.org
Message-ID: <CADiAo4+AHpenrWj69th=3m=1axW4wgrT-Rd20min9=PpxMpNAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I cannot build modular X.org with buildroot-2012.02. TinyX built fine.

Build fails on the input driver: xdriver_xf86-input-evdev (this is the
first driver in the driver section selected)

End of output before the error:

============================================================
checking whether to build static libraries... yes
checking for i586-linux-gcc... (cached)
/40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
/40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether
/40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
/40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
accepts -g... (cached) yes
checking for /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
/40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
option to accept ISO C89... (cached) none needed
checking dependency style of
/40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
/40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc...
(cached) gcc3
checking for /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
/40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
option to accept ISO C99... -std=gnu99
checking pkg-config is at least version 0.9.0... yes
checking for XORG... configure: error: Package requirements
(xorg-server xproto ) were not met:

No package 'xorg-server' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables XORG_CFLAGS
and XORG_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

make: *** [/40G2/golubovsky/src/buildroot-2012.02/output/build/xdriver_xf86-input-evdev-2.3.0/.stamp_configured]
Error 1
============================================================

Thanks.

-- 
Dimitry Golubovsky

Anywhere on the Web
