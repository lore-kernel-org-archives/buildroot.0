From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 May 2017 16:17:06 +0200
Subject: [Buildroot] [git commit branch/next] package/gcc: remove gcc 4.8
Message-ID: <20170524141954.B1AB87FEC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f66952197b41452b77dfa065adc7172137e4c243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We're already using 5.x as default, and have 4.9.x on the lower side
together with 7.x (7.1) on the higher side.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  10 +
 ...et-68059-libgcc-should-not-use-__write-fo.patch |  43 --
 package/gcc/4.8.5/100-uclibc-conf.patch            |  15 -
 ...00-powerpc-link-with-math-lib.patch.conditional | 122 ----
 package/gcc/4.8.5/111-pr65730.patch                |  37 --
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |  29 -
 package/gcc/4.8.5/130-fix_build_with_gcc-6.patch   | 153 -----
 package/gcc/4.8.5/130-pr43538.patch                |  25 -
 package/gcc/4.8.5/301-missing-execinfo_h.patch     |  13 -
 .../gcc/4.8.5/305-libmudflap-susv3-legacy.patch    |  49 --
 package/gcc/4.8.5/810-arm-softfloat-libgcc.patch   |  30 -
 package/gcc/4.8.5/830-arm_unbreak_armv4t.patch     |  13 -
 package/gcc/4.8.5/841-PR57717-E500v2.patch         |  23 -
 package/gcc/4.8.5/842-PR60155.patch                | 111 ----
 .../4.8.5/843-aarch64-vmlaq_lane_s32-typo.patch    |  24 -
 package/gcc/4.8.5/850-libstdcxx-uclibc-c99.patch   | 273 ---------
 package/gcc/4.8.5/851-PR-other-56780.patch         | 244 --------
 .../870-xtensa-add-mauto-litpools-option.patch     | 290 ---------
 .../871-xtensa-reimplement-register-spilling.patch |  76 ---
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |  33 --
 .../gcc/4.8.5/873-xtensa-fix-_Unwind_GetCFA.patch  |  40 --
 .../gcc/4.8.5/874-xtensa-add-uclinux-support.patch | 174 ------
 package/gcc/4.8.5/890-fix-m68k-compile.patch       |  15 -
 package/gcc/4.8.5/891-fix-m68k-uclinux.patch       |  18 -
 package/gcc/4.8.5/900-musl-support.patch           | 648 ---------------------
 .../930-libgcc-disable-split-stack-nothreads.patch |  14 -
 package/gcc/4.8.5/940-uclinux-enable-threads.patch |  19 -
 package/gcc/Config.in.host                         |  24 -
 package/uclibc/uclibc.mk                           |   6 -
 29 files changed, 10 insertions(+), 2561 deletions(-)

Patch is too large, so refusing to show it
