From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat,  1 Aug 2020 01:19:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmbim: bump version to 1.24.2
Message-ID: <20200731231930.20337-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

tested (failure in andes-nds32 is due libffi not being ported to
nds32le-buildroot-linux-gnu => usual error).

Kind regards,
Petr
                             andes-nds32 [ 1/45]: FAILED
                             arm-aarch64 [ 2/45]: OK
                        br-aarch64-glibc [ 3/45]: OK
                           br-arcle-hs38 [ 4/45]: OK
                            br-arm-basic [ 5/45]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/45]: OK
                   br-arm-cortex-a9-musl [ 7/45]: OK
                   br-arm-cortex-m4-full [ 8/45]: SKIPPED
                             br-arm-full [ 9/45]: OK
                    br-arm-full-nothread [10/45]: SKIPPED
                      br-arm-full-static [11/45]: OK
                br-i386-pentium-mmx-musl [12/45]: OK
                   br-i386-pentium4-full [13/45]: OK
                    br-microblazeel-full [14/45]: OK
                      br-mipsel-o32-full [15/45]: OK
                 br-mips32r6-el-hf-glibc [16/45]: OK
                      br-mips64-n64-full [17/45]: OK
                 br-mips64r6-el-hf-glibc [18/45]: OK
                       br-m68k-5208-full [19/45]: SKIPPED
                      br-m68k-68040-full [20/45]: OK
                          br-nios2-glibc [21/45]: OK
                      br-openrisc-uclibc [22/45]: OK
                  br-powerpc-e500mc-full [23/45]: OK
               br-powerpc-603e-basic-cpp [24/45]: SKIPPED
             br-powerpc64le-power8-glibc [25/45]: OK
               br-powerpc64-power7-glibc [26/45]: OK
                              br-riscv32 [27/45]: OK
                              br-riscv64 [28/45]: OK
                         br-riscv64-musl [29/45]: OK
                             br-sh4-full [30/45]: OK
                         br-sparc-uclibc [31/45]: OK
                        br-sparc64-glibc [32/45]: OK
                          br-xtensa-full [33/45]: OK
                    br-x86-64-core2-full [34/45]: OK
                          br-x86-64-musl [35/45]: OK
                       linaro-aarch64-be [36/45]: OK


 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 828bea0f92..5cd1e51ffd 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  5c0778eb1cd12c3604523134e55183f5147b0cae71150e875b583768f7aa1f38  libmbim-1.22.0.tar.xz
+sha256  32198c099987849c5f442d1cbf4b6e43e645cbdbe9cfdc197b19ddd63c6981e4  libmbim-1.24.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 67cfd2bc0b..f9c1ec9953 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.22.0
+LIBMBIM_VERSION = 1.24.2
 LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.27.0
