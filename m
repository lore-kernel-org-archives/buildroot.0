From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 16 Jun 2020 18:25:39 +0200
Subject: [Buildroot] [PATCH] package/iproute2: bump to version 5.7.0
Message-ID: <20200616162539.17854-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

tested:
                             andes-nds32 [ 1/44]: OK
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: OK
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: OK
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: OK
                      br-arm-full-static [11/44]: OK
                br-i386-pentium-mmx-musl [12/44]: OK
                   br-i386-pentium4-full [13/44]: OK
                    br-microblazeel-full [14/44]: OK
                      br-mipsel-o32-full [15/44]: OK
                 br-mips32r6-el-hf-glibc [16/44]: OK
                      br-mips64-n64-full [17/44]: OK
                 br-mips64r6-el-hf-glibc [18/44]: OK
                       br-m68k-5208-full [19/44]: SKIPPED
                      br-m68k-68040-full [20/44]: OK
                          br-nios2-glibc [21/44]: OK
                      br-openrisc-uclibc [22/44]: OK
                  br-powerpc-e500mc-full [23/44]: OK
               br-powerpc-603e-basic-cpp [24/44]: OK
             br-powerpc64le-power8-glibc [25/44]: OK
               br-powerpc64-power7-glibc [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                         br-sparc-uclibc [30/44]: OK
                        br-sparc64-glibc [31/44]: OK
                          br-xtensa-full [32/44]: OK
                    br-x86-64-core2-full [33/44]: OK
                          br-x86-64-musl [34/44]: OK
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: OK
                            sourcery-arm [39/44]: OK
                     sourcery-arm-thumb2 [40/44]: OK
                           sourcery-mips [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                          sourcery-nios2 [43/44]: OK
                         sourcery-x86-64 [44/44]: OK
44 builds, 2 skipped, 0 build failed, 0 legal-info failed

 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 0477eb71bf..b2a9e21e11 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  1b5b0e25ce6e23da7526ea1da044e814ad85ba761b10dd29c2b027c056b04692  iproute2-5.6.0.tar.xz
+sha256  725dc7ba94aae54c6f8d4223ca055d9fb4fe89d6994b1c03bfb4411c4dd10f21  iproute2-5.7.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index e5841cc460..1b71f5c06a 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.6.0
+IPROUTE2_VERSION = 5.7.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.27.0
