From: Echo6 <echo6_uk@yahoo.com>
Date: Mon, 2 Aug 2010 03:11:52 -0700 (PDT)
Subject: [Buildroot] Unable to build gmp
Message-ID: <15695.81891.qm@web35401.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is my first foray into Buildroot, I'm interested in building some tools for 
the Android platform (arm).

I get the following error.

checking build system type... i686-pc-linux-gnu
checking host system type... arm-unknown-linux-gnu
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for arm-linux-strip... 
/home/echo6/source/buildroot-2010.05/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-strip

checking whether to enable maintainer-specific portions of Makefiles... no
checking ABI=standard
checking whether 
/home/echo6/source/buildroot-2010.05/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
 -Os -pipe -Os  -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-I/home/echo6/source/buildroot-2010.05/output/staging/usr/include 
-I/home/echo6/source/buildroot-2010.05/output/staging/include 
--sysroot=/home/echo6/source/buildroot-2010.05/output/staging/ -isysroot 
/home/echo6/source/buildroot-2010.05/output/staging is gcc... yes
checking compiler 
/home/echo6/source/buildroot-2010.05/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
 -Os -pipe -Os  -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-I/home/echo6/source/buildroot-2010.05/output/staging/usr/include 
-I/home/echo6/source/buildroot-2010.05/output/staging/include 
--sysroot=/home/echo6/source/buildroot-2010.05/output/staging/ -isysroot 
/home/echo6/source/buildroot-2010.05/output/staging -O3 -fomit-frame-pointer ... 
no, gnupro alpha ev6 char spilling
configure: error: could not find a working compiler, see config.log for details
make: *** 
[/home/echo6/source/buildroot-2010.05/output/build/gmp-4.2.4/.configured] Error 
1

Could not find working compiler??

Regards,
Jon.
