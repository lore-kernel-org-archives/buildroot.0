From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Fri, 09 Dec 2011 09:47:16 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
Message-ID: <4EE1CB14.9010802@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tried a simple build (.config in attachment) on a 64-bit Linux (openSUSE 12.1) with CS 2009q1 toolchain (and last buildroot trunk) and some libs are built to output/target/usr/lib64/ so they are not found as dependencies. With the .config in attachment, you can try a build and check directfb config.log file and PNG lib and others are not found, so directfb is built without support for them. In the final image, they are also in usr/lib64 folder. It may be a problem for other packages.

What could be the problem and how to solve it?

List of files in lib64:
directfb-1.4-6
libdirect-1.4.so.6
libdirect-1.4.so.6.0.9
libdirect.a
libdirectfb-1.4.so.6
libdirectfb-1.4.so.6.0.9
libdirectfb.a
libdirectfb.la
libdirectfb.so
libdirect.la
libdirect.so
libexif.a
libexif.la
libexif.so
libexif.so.12
libexif.so.12.3.2
libfreetype.a
libfreetype.la
libfreetype.so
libfreetype.so.6
libfreetype.so.6.8.0
libfusion-1.4.so.6
libfusion-1.4.so.6.0.9
libfusion.a
libfusion.la
libfusion.so
libjpeg.a
libjpeg.la
libjpeg.so
libjpeg.so.8
libjpeg.so.8.3.0
libpng14.a
libpng14.la
libpng14.so
libpng14.so.14
libpng14.so.14.8.0
libpng.a
libpng.la
libpng.so
libts-1.0.so.0
libts-1.0.so.0.0.0
libts.a
libts.la
libts.so
libungif.a
libungif.la
libungif.so
libungif.so.4
libungif.so.4.1.4
pkgconfig
ts

Best regards,

Guillaume

-------------- next part --------------
A non-text attachment was scrubbed...
Name: test.config
Type: application/x-config
Size: 18316 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111209/dd83d763/attachment-0001.bin>
