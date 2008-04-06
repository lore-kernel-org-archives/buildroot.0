From: Micha Holzmann <holzmann@gmx.de>
Date: Sun, 6 Apr 2008 12:47:21 +0200
Subject: [Buildroot] C compiler cannot create executables
Message-ID: <20080406104721.GC3033@gandalf.pf.mhnet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

after compiling buildroot successfully, i mounted the rootfs via loop,
copied the tar sources into the rootfs an did chroot. After cd to the
tar source dir i run ./configure.

sh-3.2# ./configure
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... no
checking for mawk... no
checking for nawk... no
checking for awk... awk
checking whether make sets $(MAKE)... yes
checking for style of include used by make... GNU
checking for gcc... gcc
checking for C compiler default output file name... configure: error: C
compiler cannot create executables
See `config.log' for more details.

in config.log i found: /usr/bin/ld: cannot find -lgcc

What have i did wrong or what is missing.

Best regards,
Micha Holzmann

-- 
Who the hell is General Failure, and why he is reading my disk?
