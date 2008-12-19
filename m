From: Matt Wood <mattwood2000@gmx.net>
Date: Fri, 19 Dec 2008 19:48:04 +0100
Subject: [Buildroot] alsa-lib error
Message-ID: <20081219184804.186620@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone tried to compile alsa-lib lately?  Just tried and got the following error:

/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os  -I/usr/arm/buildroot/build_arm/staging_dir/usr/include -I/usr/arm/buildroot/build_arm/staging_dir/include --sysroot=/usr/arm/buildroot/build_arm/staging_dir/ -isysroot /usr/arm/buildroot/build_arm/staging_dir -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -shared  .libs/hda.o .libs/sbasedl.o  -Wl,--rpath -Wl,/usr/arm/buildroot/build_arm/alsa-lib-1.0.18/src/.libs -L/usr/arm/buildroot/build_arm/staging_dir/lib -L/usr/arm/buildroot/build_arm/staging_dir/usr/lib -lm ../../../src/.libs/libasound.so  -mabi=aapcs-linux -Wl,-soname -Wl,smixer-hda.so -o .libs/smixer-hda.so
In file included from /usr/include/python2.5/Python.h:62,
                 from python.c:22:
/usr/include/python2.5/pyport.h:761:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar cru .libs/smixer-hda.a  hda.o sbasedl.o
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ranlib .libs/smixer-hda.a

Any ideas?

Thanks, Matt.
-- 
Psssst! Schon vom neuen GMX MultiMessenger geh?rt? Der kann`s mit allen: http://www.gmx.net/de/go/multimessenger
