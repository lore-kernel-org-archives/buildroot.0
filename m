From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:57:25 +0200
Subject: [Buildroot] configs/arcturus_ucls1012a_defconfig does not build
Message-ID: <20200808185725.40db193f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

The configs/arcturus_ucls1012a_defconfig configuration in Buildroot no
longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674933582

U-Boot is failing to build, with:

In file included from include/linux/compiler.h:54,
                 from include/linux/bitops.h:5,
                 from ./include/common.h:20:
include/linux/compiler-gcc.h:114:1: fatal error: linux/compiler-gcc9.h: No such file or directory
  114 | #include gcc_header(__GNUC__)
      | ^~~~
compilation terminated.

Could you send a patch to update U-Boot for this platform ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
