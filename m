From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 13 Dec 2010 11:48:03 +0100
Subject: [Buildroot] can't compile mplayer for ARM with actual buildroot
	5a6f6bfe885754955b615ca9353baa3496682c6f
Message-ID: <AANLkTimto_ZpVXosSAAv8YtVS6o+o94y12MU3mx5cOcj@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to compile mplayer for ARM produce following error:

buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/home/open-nandra/projects/buildroot/output/staging
-I../libswscale -I../libavcodec  -DHAVE_AV_CONFIG_H -D_ISOC9X_SOURCE
-I.. -I.. -I../libavutil -Wdisabled-optimization -Wno-pointer-sign
-Wdeclaration-after-statement -I. -I.. -I../libavutil -pipe -Os
-mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/open-nandra/projects/buildroot/output/staging/usr/include
-I/home/open-nandra/projects/buildroot/output/staging/include
-D_REENTRANT -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H
-I/home/open-nandra/projects/buildroot/output/staging/usr/include   -c
-o armv4l/dsputil_arm_s.o armv4l/dsputil_arm_s.S
armv4l/dsputil_arm_s.S: Assembler messages:
armv4l/dsputil_arm_s.S:79: Error: selected processor does not support `pld [r1]'
armv4l/dsputil_arm_s.S:90: Error: selected processor does not support `pld [r1]'
armv4l/dsputil_arm_s.S:100: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:111: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:122: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:141: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:152: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:162: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:173: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:184: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:203: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:215: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:228: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:241: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:253: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:272: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:284: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:297: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:310: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:322: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:343: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:357: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:363: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:374: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:378: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:385: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:397: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:401: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:408: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:420: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:424: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:431: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:452: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:466: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:472: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:483: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:487: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:494: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:506: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:510: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:517: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:529: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:533: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:540: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:625: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:633: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:633: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:637: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:637: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:641: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:641: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:645: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:645: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:661: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:669: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:669: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:673: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:673: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:677: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:677: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:681: Error: selected processor does not support
`pld [r1]'
armv4l/dsputil_arm_s.S:681: Error: selected processor does not support
`pld [r1]'
make[2]: *** [armv4l/dsputil_arm_s.o] Error 1
make[2]: Leaving directory
`/home/open-nandra/projects/buildroot/output/build/MPlayer-1.0rc2/libavcodec'
make[1]: *** [libavcodec/libavcodec.a] Error 2
make[1]: Leaving directory
`/home/open-nandra/projects/buildroot/output/build/MPlayer-1.0rc2'
make: *** [/home/open-nandra/projects/buildroot/output/build/MPlayer-1.0rc2/mplayer]
Error 2

.config in attachment.

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 16060 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101213/fe96577a/attachment-0001.obj>
