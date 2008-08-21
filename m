From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 21 Aug 2008 14:03:50 +0200
Subject: [Buildroot] mpfr for host on gentoo
Message-ID: <48AD59A6.3040607@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix for mpfr on gentoo host.
...
checking for i386-pc-linux-gnu-ar... no
checking for ar... ar
checking for i386-pc-linux-gnu-ranlib... no
checking for ranlib... ranlib
checking for i386-pc-linux-gnu-strip... no
checking for strip... strip
checking for correct ltmain.sh version... no
configure: error:

*** [Gentoo] sanity check failed! ***
*** libtool.m4 and ltmain.sh have a version mismatch! ***
*** (libtool.m4 = 1.5.26, ltmain.sh = "1.5.24 Debian 1.5.24-1") ***

Please run:

  libtoolize --copy --force

if appropriate, please contact the maintainer of this
package (or your distribution) for help.

make[1]: *** [config.status] Error 1
make[1]: Leaving directory `/work/buildroot/toolchain_build_cris/mpfr-2.3.1-host'
make: *** [/work/buildroot/toolchain_build_cris/mpfr/lib/libmpfr.so] Error 2

Thank you,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si

-------------- next part --------------
A non-text attachment was scrubbed...
Name: mpfr.patch
Type: text/x-patch
Size: 411 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080821/2a8520fa/attachment.bin 
