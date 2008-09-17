From: Steven Woody <narkewoody@gmail.com>
Date: Wed, 17 Sep 2008 10:38:08 +0800
Subject: [Buildroot] Build again (busybox build error)
Message-ID: <ed4892840809161938x25d119e0s71959338c555f391@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I again to try buildroot and start from 0916 snapshot tallball.  This
time, I get compile error when building busybox:


Trying libraries: crypt m
Failed: -Wl,--start-group -lcrypt -lm -Wl,--end-group
Output of:
/home/woody/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused
-Wunused-parameter -Wmissing-prototypes -Wmissing-declarations
-Wdeclaration-after-statement -Wold-style-definition
-fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer
-ffunction-sections -fdata-sections -fno-guess-branch-probability
-funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1
-falign-labels=1 -falign-loops=1 -Os -o busybox_unstripped
-Wl,--sort-common -Wl,--sort-section,alignment -Wl,--gc-sections
-Wl,--start-group applets/built-in.o archival/lib.a
archival/libunarchive/lib.a console-tools/lib.a coreutils/lib.a
coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a
editors/lib.a findutils/lib.a init/lib.a libbb/lib.a libpwdgrp/lib.a
loginutils/lib.a miscutils/lib.a modutils/lib.a networking/lib.a
networking/libiproute/lib.a networking/udhcp/lib.a printutils/lib.a
procps/lib.a runit/lib.a selinux/lib.a shell/lib.a sysklogd/lib.a
util-linux/lib.a util-linux/volume_id/lib.a archival/built-in.o
archival/libunarchive/built-in.o console-tools/built-in.o
coreutils/built-in.o coreutils/libcoreutils/built-in.o
debianutils/built-in.o e2fsprogs/built-in.o editors/built-in.o
findutils/built-in.o init/built-in.o libbb/built-in.o
libpwdgrp/built-in.o loginutils/built-in.o miscutils/built-in.o
modutils/built-in.o networking/built-in.o
networking/libiproute/built-in.o networking/udhcp/built-in.o
printutils/built-in.o procps/built-in.o runit/built-in.o
selinux/built-in.o shell/built-in.o sysklogd/built-in.o
util-linux/built-in.o util-linux/volume_id/built-in.o -Wl,--end-group
-Wl,--start-group -lcrypt -lm -Wl,--end-group


attached is my busybox config.

Please help to check.  Thanks.

-
narke
-------------- next part --------------
A non-text attachment was scrubbed...
Name: busybox-1.11.2.config
Type: application/octet-stream
Size: 21012 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080917/a1535bbb/attachment-0001.obj 
