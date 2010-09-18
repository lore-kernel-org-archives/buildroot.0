From: manick raj <manickaraj17@gmail.com>
Date: Sat, 18 Sep 2010 14:28:01 +0500
Subject: [Buildroot] Error while cross compiling gettext-0.18.1.1 using
	buildroot-2010.08
Message-ID: <AANLkTikm-wSpO=u5-V+MAYLxTTNrnMSMRsVR_-Qyn9Cd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I got error messeage while building rootfs,can anybody tell me the solution



 /home/manickaraj/buildroot-2010.08/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/home/manickaraj/buildroot-2010.08/output/staging -DHAVE_CONFIG_H
-DEXEEXT=\"\" -I. -I..  -I../intl -I../intl -DDEPENDS_ON_LIBICONV=1
-DDEPENDS_ON_LIBINTL=1
-I/home/manickaraj/buildroot-2010.08/output/staging/usr/include  -pipe -Os
 -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/manickaraj/buildroot-2010.08/output/staging/usr/include
-I/home/manickaraj/buildroot-2010.08/output/staging/include -c -o
uniwidth/width.o uniwidth/width.c
In file included from ./stdint.h:484,
                 from ./unitypes.h:22,
                 from ./uniwidth.h:22,
                 from uniwidth/width.c:21:
./wchar.h:510: error: expected ')' before '*' token
make[6]: *** [uniwidth/width.o] Error 1
make[6]: Leaving directory
`/home/manickaraj/buildroot-2010.08/output/build/gettext-0.18.1.1/gettext-runtime/gnulib-lib'
make[5]: *** [all-recursive] Error 1
make[5]: Leaving directory
`/home/manickaraj/buildroot-2010.08/output/build/gettext-0.18.1.1/gettext-runtime/gnulib-lib'
make[4]: *** [all] Error 2
make[4]: Leaving directory
`/home/manickaraj/buildroot-2010.08/output/build/gettext-0.18.1.1/gettext-runtime/gnulib-lib'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/manickaraj/buildroot-2010.08/output/build/gettext-0.18.1.1/gettext-runtime'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/manickaraj/buildroot-2010.08/output/build/gettext-0.18.1.1/gettext-runtime'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/manickaraj/buildroot-2010.08/output/build/gettext-0.18.1.1'
make: ***
[/home/manickaraj/buildroot-2010.08/output/build/gettext-0.18.1.1/gettext-runtime/src/gettext]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100918/8e032d27/attachment.html>
