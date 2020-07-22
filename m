From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 22 Jul 2020 21:23:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/debianutils: bump version to 4.11
Message-ID: <20200722192340.12515-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+ updated copyright hash

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

Kind regards,
Petr

 package/debianutils/debianutils.hash | 6 +++---
 package/debianutils/debianutils.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index e07f405ee9..16a45d4ea1 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,4 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20190828T161440Z/pool/main/d/debianutils/debianutils_4.8.6.3.dsc
-sha256 2cc7de3afc6df1cf6d00af9938efac7ee8f739228e548e512ddc186b6a7be221 debianutils_4.8.6.3.tar.xz
+# From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
+sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
 # Locally calculated
-sha256 a8698f078cd21fc501e66d070e12cf2f23ec1eaf5841bbc87629de76858ef7a7 debian/copyright
+sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index a91383c17a..d2c41130fb 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.8.6.3
+DEBIANUTILS_VERSION = 4.11
 DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
-DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20190828T161440Z/pool/main/d/debianutils
+DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
 DEBIANUTILS_LICENSE_FILES = debian/copyright
-- 
2.27.0
