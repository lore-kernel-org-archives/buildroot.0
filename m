From: Bart Otten <bartotten@gmail.com>
Date: Thu, 29 Apr 2010 21:40:49 +0200
Subject: [Buildroot] Mplayer
Message-ID: <w2w76d09b281004291240oe35449fdz226a42e12a5097a0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I get a error building mplayer with buildroot, how can i fix it?

make[1]: Entering directory
`/home/Bart/Downloads/buildroot-2010.02/output/build/MPlayer-1.0rc2'
/home/Bart/Downloads/buildroot-2010.02/output/staging/usr/bin/i586-linux-uclibc-gcc
-I./libavcodec -I./libavformat -Wdisabled-optimization -Wno-pointer-sign
-Wdeclaration-after-statement -I. -I. -I./libavutil -Os -pipe -Os
-I/home/Bart/Downloads/buildroot-2010.02/output/staging/usr/include
-I/home/Bart/Downloads/buildroot-2010.02/output/staging/include
--sysroot=/home/Bart/Downloads/buildroot-2010.02/output/staging/ -isysroot
/home/Bart/Downloads/buildroot-2010.02/output/staging -mtune=geode
-march=geode -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -fomit-frame-pointer -D_REENTRANT -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H
-I/home/Bart/Downloads/buildroot-2010.02/output/staging/usr/include
-I/usr/X11/include -c -o mplayer.o mplayer.c
/home/Bart/Downloads/buildroot-2010.02/output/staging/usr/bin/i586-linux-uclibc-gcc
-I./libavcodec -I./libavformat -Wdisabled-optimization -Wno-pointer-sign
-Wdeclaration-after-statement -I. -I. -I./libavutil -Os -pipe -Os
-I/home/Bart/Downloads/buildroot-2010.02/output/staging/usr/include
-I/home/Bart/Downloads/buildroot-2010.02/output/staging/include
--sysroot=/home/Bart/Downloads/buildroot-2010.02/output/staging/ -isysroot
/home/Bart/Downloads/buildroot-2010.02/output/staging -mtune=geode
-march=geode -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -fomit-frame-pointer -D_REENTRANT -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H
-I/home/Bart/Downloads/buildroot-2010.02/output/staging/usr/include
-I/usr/X11/include -c -o m_property.o m_property.c
In file included from /usr/X11/include/features.h:354,
from /usr/X11/include/stdio.h:28,
from mplayer.c:5:
/usr/X11/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No such file or
directory
In file included from /usr/X11/include/features.h:354,
from /usr/X11/include/stdlib.h:25,
from m_property.c:7:
/usr/X11/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No such file or
directory
make[1]: *** [m_property.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [mplayer.o] Error 1
make[1]: Leaving directory
`/home/Bart/Downloads/buildroot-2010.02/output/build/MPlayer-1.0rc2'
make: ***
[/home/Bart/Downloads/buildroot-2010.02/output/build/MPlayer-1.0rc2/mplayer]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100429/a3bb2c39/attachment-0001.htm>
