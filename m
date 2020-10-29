From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 29 Oct 2020 17:32:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/ima-evm-utils: Bump to version 1.3.2
Message-ID: <20201029163214.5600-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch from upstream.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Reason to update:
* Bugfixes: importing keys

Tested:
                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                    bootlin-x86-64-glibc [ 3/45]: OK
                        br-aarch64-glibc [ 4/45]: OK
                           br-arcle-hs38 [ 5/45]: OK
                            br-arm-basic [ 6/45]: OK
                  br-arm-cortex-a9-glibc [ 7/45]: OK
                   br-arm-cortex-a9-musl [ 8/45]: OK
                   br-arm-cortex-m4-full [ 9/45]: SKIPPED
                             br-arm-full [10/45]: OK
                    br-arm-full-nothread [11/45]: OK
                      br-arm-full-static [12/45]: SKIPPED
                br-i386-pentium-mmx-musl [13/45]: OK
                   br-i386-pentium4-full [14/45]: OK
                    br-microblazeel-full [15/45]: OK
                      br-mipsel-o32-full [16/45]: OK
                 br-mips32r6-el-hf-glibc [17/45]: OK
                      br-mips64-n64-full [18/45]: OK
                 br-mips64r6-el-hf-glibc [19/45]: OK
                       br-m68k-5208-full [20/45]: SKIPPED
                      br-m68k-68040-full [21/45]: OK
                          br-nios2-glibc [22/45]: OK
                      br-openrisc-uclibc [23/45]: OK
                  br-powerpc-e500mc-full [24/45]: OK
               br-powerpc-603e-basic-cpp [25/45]: OK
             br-powerpc64le-power8-glibc [26/45]: OK
               br-powerpc64-power7-glibc [27/45]: OK
                              br-riscv32 [28/45]: FAILED
                              br-riscv64 [29/45]: OK
                         br-riscv64-musl [30/45]: OK
                             br-sh4-full [31/45]: OK
                         br-sparc-uclibc [32/45]: OK
                        br-sparc64-glibc [33/45]: OK
                          br-xtensa-full [34/45]: OK
                    br-x86-64-core2-full [35/45]: OK
                          br-x86-64-musl [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                           sourcery-mips [43/45]: OK
                         sourcery-mips64 [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 3 skipped, 1 build failed, 0 legal-info failed

Kind regards,
Petr

 package/ima-evm-utils/ima-evm-utils.hash | 4 ++--
 package/ima-evm-utils/ima-evm-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 8d0eecfdb9..2cdba227ad 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,4 +1,4 @@
 # sha1 from sourceforge, sha256 locally computed
-sha1  bb0c1c2de5f6c179d9a84909e5e6698b86a4aac2  ima-evm-utils-1.3.1.tar.gz
-sha256 5304271f31a3601a2af5984942d9bd6c7532597c5a97250c9a4524074fc39925  ima-evm-utils-1.3.1.tar.gz
+sha1  034d163533ae5f9c06001b375ec7e5a1b09a3853  ima-evm-utils-1.3.2.tar.gz
+sha256 c2b206e7f9fbe62a938b7ae59e31906fefae4d5351fe01db739bd8346b75d4a7  ima-evm-utils-1.3.2.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index 5c9aa2f7cd..cc53e02dd6 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.3.1
+IMA_EVM_UTILS_VERSION = 1.3.2
 IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
-- 
2.29.0
