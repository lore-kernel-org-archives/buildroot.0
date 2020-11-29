From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 29 Nov 2020 21:58:42 +0100
Subject: [Buildroot] [PATCH/next v1] package/fmt: bump version to 7.1.3
Message-ID: <20201129205842.17124-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1], [2], [3] and [4].

[1] https://github.com/fmtlib/fmt/releases/tag/7.1.0
[2] https://github.com/fmtlib/fmt/releases/tag/7.1.1
[3] https://github.com/fmtlib/fmt/releases/tag/7.1.2
[4] https://github.com/fmtlib/fmt/releases/tag/7.1.3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - checked with
	BR2_PACKAGE_FMT=y

                             andes-nds32 [ 1/45]: SKIPPED
                             arm-aarch64 [ 2/45]: OK
                    bootlin-x86-64-glibc [ 3/45]: OK
                        br-aarch64-glibc [ 4/45]: OK
                           br-arcle-hs38 [ 5/45]: OK
                            br-arm-basic [ 6/45]: SKIPPED
                  br-arm-cortex-a9-glibc [ 7/45]: OK
                   br-arm-cortex-a9-musl [ 8/45]: OK
                   br-arm-cortex-m4-full [ 9/45]: OK
                             br-arm-full [10/45]: OK
                    br-arm-full-nothread [11/45]: OK
                      br-arm-full-static [12/45]: OK
                   br-i386-pentium4-full [13/45]: OK
                br-i386-pentium-mmx-musl [14/45]: OK
                       br-m68k-5208-full [15/45]: OK
                      br-m68k-68040-full [16/45]: OK
                    br-microblazeel-full [17/45]: OK
                 br-mips32r6-el-hf-glibc [18/45]: OK
                      br-mips64-n64-full [19/45]: OK
                 br-mips64r6-el-hf-glibc [20/45]: OK
                      br-mipsel-o32-full [21/45]: OK
                          br-nios2-glibc [22/45]: OK
                      br-openrisc-uclibc [23/45]: OK
               br-powerpc-603e-basic-cpp [24/45]: SKIPPED
             br-powerpc64le-power8-glibc [25/45]: OK
               br-powerpc64-power7-glibc [26/45]: OK
                  br-powerpc-e500mc-full [27/45]: OK
                              br-riscv32 [28/45]: FAILED

^[[7m>>> toolchain-external-bootlin 2020.08-1 Patching^[[27m
^[[7m>>> toolchain-external-bootlin 2020.08-1 Configuring^[[27m
f951: Warning: Reading file ?<stdin>? as free form
RPC support not available in C library, please disable BR2_TOOLCHAIN_EXTERNAL_INET_RPC

                              br-riscv64 [29/45]: OK
                         br-riscv64-musl [30/45]: OK
                             br-sh4-full [31/45]: OK
                        br-sparc64-glibc [32/45]: OK
                         br-sparc-uclibc [33/45]: OK
                    br-x86-64-core2-full [34/45]: OK
                          br-x86-64-musl [35/45]: OK
                          br-xtensa-full [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 1f45c212f3..7947a17456 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  decfdf9ad274070fa85f26407b816f5a4d82205ae86bac1990be658d0795ea4d  fmt-7.0.3.zip
+sha256  5d98c504d0205f912e22449ecdea776b78ce0bb096927334f80781e720084c9f  fmt-7.1.3.zip
 sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 0539dcc024..000bacfd7b 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 7.0.3
+FMT_VERSION = 7.1.3
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
-- 
2.29.2
