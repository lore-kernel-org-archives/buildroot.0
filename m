From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 13:08:56 +0200
Subject: [Buildroot] [git commit] gcc: bump 5.x series to version 5.4.0
Message-ID: <20160607110913.EEE0681913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb4809e0678fea764cc136f8d5d2a6ff6a69a522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

130-fix_build_with_gcc-6.patch is upstream so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/5.3.0/130-fix_build_with_gcc-6.patch   | 153 ---------------------
 package/gcc/{5.3.0 => 5.4.0}/100-uclibc-conf.patch |   0
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |   0
 .../{5.3.0 => 5.4.0}/301-missing-execinfo_h.patch  |   0
 .../810-arm-softfloat-libgcc.patch                 |   0
 .../{5.3.0 => 5.4.0}/830-arm_unbreak_armv4t.patch  |   0
 .../840-microblaze-enable-dwarf-eh-support.patch   |   0
 .../850-libstdcxx-uclibc-c99.patch                 |   0
 package/gcc/{5.3.0 => 5.4.0}/860-cilk-wchar.patch  |   0
 .../870-xtensa-add-mauto-litpools-option.patch     |   0
 .../871-xtensa-reimplement-register-spilling.patch |   0
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |   0
 .../873-xtensa-fix-_Unwind_GetCFA.patch            |   0
 .../874-xtensa-add-uclinux-support.patch           |   0
 .../{5.3.0 => 5.4.0}/890-fix-m68k-compile.patch    |   0
 .../{5.3.0 => 5.4.0}/891-fix-m68k-uclinux.patch    |   0
 .../{5.3.0 => 5.4.0}/892-microblaze-uclibc.patch   |   0
 .../900-libitm-fixes-for-musl-support.patch        |   0
 .../901-fixincludes-update-for-musl-support.patch  |   0
 .../{5.3.0 => 5.4.0}/902-unwind-fix-for-musl.patch |   0
 ...dc++-libgfortran-gthr-workaround-for-musl.patch |   0
 .../{5.3.0 => 5.4.0}/904-musl-libc-config.patch    |   0
 .../905-add-musl-support-to-gcc.patch              |   0
 .../{5.3.0 => 5.4.0}/906-mips-musl-support.patch   |   0
 .../{5.3.0 => 5.4.0}/907-x86-musl-support.patch    |   0
 .../{5.3.0 => 5.4.0}/908-arm-musl-support.patch    |   0
 .../909-aarch64-musl-support.patch                 |   0
 .../930-libgcc-disable-split-stack-nothreads.patch |   0
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 30 files changed, 3 insertions(+), 156 deletions(-)

Patch is too large, so refusing to show it
