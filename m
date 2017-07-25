From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:05:41 +0200
Subject: [Buildroot] [git commit] toolchain-configs.csv: remove unused libc
	column
Message-ID: <20170725210435.8229A7FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fc29ec2a76fc3a629a71cf3596b7253db6b7ea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This column is not used by either genrandconfig or test-pkg, so remove
it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../autobuild/toolchain-configs.csv                | 104 ++++++++++-----------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 15f6546..80a6d04 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -1,52 +1,52 @@
-support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config,x86,glibc
-support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config,x86,glibc
-support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64,glibc
-support/config-fragments/autobuild/br-arc-full-internal.config,any,uclibc
-support/config-fragments/autobuild/br-arcle-hs38.config,x86_64,uclibc
-support/config-fragments/autobuild/br-arm-basic.config,x86_64,uclibc
-support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config,x86_64,glibc
-support/config-fragments/autobuild/br-arm-cortex-a9-musl.config,x86_64,musl
-support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-arm-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64,uclibc
-support/config-fragments/autobuild/br-arm-full-static.config,x86_64,uclibc
-support/config-fragments/autobuild/br-arm-internal-full.config,any,uclibc
-support/config-fragments/autobuild/br-bfin-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64,musl
-support/config-fragments/autobuild/br-m68k-5208-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-m68k-68040-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-microblazeel-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-microblazeel-full-internal.config,any,glibc
-support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config,x86_64,glibc
-support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64,glibc
-support/config-fragments/autobuild/br-mipsel-o32-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-nios2-glibc.config,x86_64,glibc
-support/config-fragments/autobuild/br-openrisc-uclibc.config,x86_64,uclibc
-support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64,uclibc
-support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config,x86_64,glibc
-support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64,glibc
-support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-powerpc-internal-full.config,any,uclibc
-support/config-fragments/autobuild/br-sh4-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64,uclibc
-support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64,glibc
-support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-x86-64-musl.config,x86_64,musl
-support/config-fragments/autobuild/br-xtensa-full.config,x86_64,uclibc
-support/config-fragments/autobuild/br-xtensa-full-internal.config,any,uclibc
-support/config-fragments/autobuild/i686-ctng-linux-gnu.config,x86,glibc
-support/config-fragments/autobuild/linaro-aarch64.config,x86,glibc
-support/config-fragments/autobuild/linaro-arm.config,x86,glibc
-support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config,x86,glibc
-support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config,x86,glibc
-support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config,x86,glibc
-support/config-fragments/autobuild/sourcery-arm-armv4t.config,x86,glibc
-support/config-fragments/autobuild/sourcery-arm.config,x86,glibc
-support/config-fragments/autobuild/sourcery-arm-thumb2.config,x86,glibc
-support/config-fragments/autobuild/sourcery-mips64.config,x86,glibc
-support/config-fragments/autobuild/sourcery-mips.config,x86,glibc
-support/config-fragments/autobuild/sourcery-nios2.config,x86,glibc
-support/config-fragments/autobuild/sourcery-x86-64.config,x86,glibc
-support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config,x86,glibc
+support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config,x86
+support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config,x86
+support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
+support/config-fragments/autobuild/br-arc-full-internal.config,any
+support/config-fragments/autobuild/br-arcle-hs38.config,x86_64
+support/config-fragments/autobuild/br-arm-basic.config,x86_64
+support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config,x86_64
+support/config-fragments/autobuild/br-arm-cortex-a9-musl.config,x86_64
+support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64
+support/config-fragments/autobuild/br-arm-full.config,x86_64
+support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
+support/config-fragments/autobuild/br-arm-full-static.config,x86_64
+support/config-fragments/autobuild/br-arm-internal-full.config,any
+support/config-fragments/autobuild/br-bfin-full.config,x86_64
+support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
+support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
+support/config-fragments/autobuild/br-m68k-5208-full.config,x86_64
+support/config-fragments/autobuild/br-m68k-68040-full.config,x86_64
+support/config-fragments/autobuild/br-microblazeel-full.config,x86_64
+support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
+support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
+support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config,x86_64
+support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
+support/config-fragments/autobuild/br-mipsel-o32-full.config,x86_64
+support/config-fragments/autobuild/br-nios2-glibc.config,x86_64
+support/config-fragments/autobuild/br-openrisc-uclibc.config,x86_64
+support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
+support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config,x86_64
+support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
+support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
+support/config-fragments/autobuild/br-powerpc-internal-full.config,any
+support/config-fragments/autobuild/br-sh4-full.config,x86_64
+support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
+support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
+support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
+support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
+support/config-fragments/autobuild/br-xtensa-full.config,x86_64
+support/config-fragments/autobuild/br-xtensa-full-internal.config,any
+support/config-fragments/autobuild/i686-ctng-linux-gnu.config,x86
+support/config-fragments/autobuild/linaro-aarch64.config,x86
+support/config-fragments/autobuild/linaro-arm.config,x86
+support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config,x86
+support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config,x86
+support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config,x86
+support/config-fragments/autobuild/sourcery-arm-armv4t.config,x86
+support/config-fragments/autobuild/sourcery-arm.config,x86
+support/config-fragments/autobuild/sourcery-arm-thumb2.config,x86
+support/config-fragments/autobuild/sourcery-mips64.config,x86
+support/config-fragments/autobuild/sourcery-mips.config,x86
+support/config-fragments/autobuild/sourcery-nios2.config,x86
+support/config-fragments/autobuild/sourcery-x86-64.config,x86
+support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config,x86
