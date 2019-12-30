From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 11:02:30 +0100
Subject: [Buildroot] [PATCH] support/config-fragments/autobuild: update
 Buildroot toolchains to 2019.11.1
Message-ID: <20191230100231.1418837-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-aarch64-glibc.config | 4 ++--
 support/config-fragments/autobuild/br-arcle-hs38.config    | 4 ++--
 support/config-fragments/autobuild/br-arm-basic.config     | 6 +++---
 .../autobuild/br-arm-cortex-a9-glibc.config                | 6 +++---
 .../autobuild/br-arm-cortex-a9-musl.config                 | 6 +++---
 .../autobuild/br-arm-cortex-m4-full.config                 | 6 +++---
 .../config-fragments/autobuild/br-arm-full-nothread.config | 6 +++---
 .../config-fragments/autobuild/br-arm-full-static.config   | 4 ++--
 support/config-fragments/autobuild/br-arm-full.config      | 4 ++--
 .../autobuild/br-i386-pentium-mmx-musl.config              | 4 ++--
 .../autobuild/br-i386-pentium4-full.config                 | 4 ++--
 .../config-fragments/autobuild/br-m68k-5208-full.config    | 6 +++---
 .../config-fragments/autobuild/br-m68k-68040-full.config   | 6 +++---
 .../config-fragments/autobuild/br-microblazeel-full.config | 4 ++--
 .../autobuild/br-mips32r6-el-hf-glibc.config               | 6 +++---
 .../config-fragments/autobuild/br-mips64-n64-full.config   | 4 ++--
 .../autobuild/br-mips64r6-el-hf-glibc.config               | 6 +++---
 .../config-fragments/autobuild/br-mipsel-o32-full.config   | 6 +++---
 support/config-fragments/autobuild/br-nios2-glibc.config   | 7 +++----
 .../config-fragments/autobuild/br-openrisc-uclibc.config   | 4 ++--
 .../autobuild/br-powerpc-603e-basic-cpp.config             | 6 +++---
 .../autobuild/br-powerpc-e500mc-full.config                | 6 +++---
 .../autobuild/br-powerpc64-power7-glibc.config             | 6 +++---
 .../autobuild/br-powerpc64le-power8-glibc.config           | 6 +++---
 support/config-fragments/autobuild/br-riscv32.config       | 6 +++---
 support/config-fragments/autobuild/br-riscv64.config       | 6 +++---
 support/config-fragments/autobuild/br-sh4-full.config      | 6 +++---
 support/config-fragments/autobuild/br-sparc-uclibc.config  | 4 ++--
 support/config-fragments/autobuild/br-sparc64-glibc.config | 4 ++--
 .../config-fragments/autobuild/br-x86-64-core2-full.config | 6 +++---
 support/config-fragments/autobuild/br-x86-64-musl.config   | 6 +++---
 support/config-fragments/autobuild/br-xtensa-full.config   | 6 +++---
 32 files changed, 85 insertions(+), 86 deletions(-)

diff --git a/support/config-fragments/autobuild/br-aarch64-glibc.config b/support/config-fragments/autobuild/br-aarch64-glibc.config
index 42b1c3316c..961ff71573 100644
--- a/support/config-fragments/autobuild/br-aarch64-glibc.config
+++ b/support/config-fragments/autobuild/br-aarch64-glibc.config
@@ -2,8 +2,8 @@ BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arcle-hs38.config b/support/config-fragments/autobuild/br-arcle-hs38.config
index eeec8f38e6..22aa667ea5 100644
--- a/support/config-fragments/autobuild/br-arcle-hs38.config
+++ b/support/config-fragments/autobuild/br-arcle-hs38.config
@@ -3,8 +3,8 @@ BR2_archs38=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
index 6f7c0ce138..edac17648d 100644
--- a/support/config-fragments/autobuild/br-arm-basic.config
+++ b/support/config-fragments/autobuild/br-arm-basic.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
index ab1c904bfd..4b17df50f3 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
index 8f96b3c10f..40349a5c33 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
index 327b490f7d..caa2269e5c 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
@@ -3,9 +3,9 @@ BR2_cortex_m4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
index 8215d0a6f9..97e1e81809 100644
--- a/support/config-fragments/autobuild/br-arm-full-nothread.config
+++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
@@ -3,9 +3,9 @@ BR2_arm1176jzf_s=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
index f1ec1cb1a0..4797ccd2f5 100644
--- a/support/config-fragments/autobuild/br-arm-full-static.config
+++ b/support/config-fragments/autobuild/br-arm-full-static.config
@@ -3,8 +3,8 @@ BR2_STATIC_LIBS=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-full.config b/support/config-fragments/autobuild/br-arm-full.config
index f27cc65619..f12b76e5e9 100644
--- a/support/config-fragments/autobuild/br-arm-full.config
+++ b/support/config-fragments/autobuild/br-arm-full.config
@@ -2,8 +2,8 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
index d177f5aed6..077e1d84ba 100644
--- a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
+++ b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
@@ -2,8 +2,8 @@ BR2_x86_pentium_mmx=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
diff --git a/support/config-fragments/autobuild/br-i386-pentium4-full.config b/support/config-fragments/autobuild/br-i386-pentium4-full.config
index cd359d7910..1fe960ba89 100644
--- a/support/config-fragments/autobuild/br-i386-pentium4-full.config
+++ b/support/config-fragments/autobuild/br-i386-pentium4-full.config
@@ -2,8 +2,8 @@ BR2_x86_pentium4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-m68k-5208-full.config b/support/config-fragments/autobuild/br-m68k-5208-full.config
index 25c7f10de5..25a2a21883 100644
--- a/support/config-fragments/autobuild/br-m68k-5208-full.config
+++ b/support/config-fragments/autobuild/br-m68k-5208-full.config
@@ -2,9 +2,9 @@ BR2_m68k=y
 BR2_m68k_cf5208=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-m68k-68040-full.config b/support/config-fragments/autobuild/br-m68k-68040-full.config
index 089b8f14fb..8803fa1db3 100644
--- a/support/config-fragments/autobuild/br-m68k-68040-full.config
+++ b/support/config-fragments/autobuild/br-m68k-68040-full.config
@@ -1,9 +1,9 @@
 BR2_m68k=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-microblazeel-full.config b/support/config-fragments/autobuild/br-microblazeel-full.config
index 2ddfb69762..5dc5e842fd 100644
--- a/support/config-fragments/autobuild/br-microblazeel-full.config
+++ b/support/config-fragments/autobuild/br-microblazeel-full.config
@@ -1,8 +1,8 @@
 BR2_microblazeel=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
index d5f60b6f28..69cb93c1f2 100644
--- a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
@@ -4,8 +4,8 @@ BR2_mips_32r6=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips64-n64-full.config b/support/config-fragments/autobuild/br-mips64-n64-full.config
index 3b95c2a9d7..cdd3029b2f 100644
--- a/support/config-fragments/autobuild/br-mips64-n64-full.config
+++ b/support/config-fragments/autobuild/br-mips64-n64-full.config
@@ -3,8 +3,8 @@ BR2_MIPS_NABI64=y
 # BR2_MIPS_SOFT_FLOAT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2019.05.1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2019.11.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
index d9c544c62b..f722b6582e 100644
--- a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
@@ -5,8 +5,8 @@ BR2_MIPS_NABI64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mipsel-o32-full.config b/support/config-fragments/autobuild/br-mipsel-o32-full.config
index 87884e0076..9c46809d82 100644
--- a/support/config-fragments/autobuild/br-mipsel-o32-full.config
+++ b/support/config-fragments/autobuild/br-mipsel-o32-full.config
@@ -2,9 +2,9 @@ BR2_mipsel=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-nios2-glibc.config b/support/config-fragments/autobuild/br-nios2-glibc.config
index cbef0bd74d..2f93714fc9 100644
--- a/support/config-fragments/autobuild/br-nios2-glibc.config
+++ b/support/config-fragments/autobuild/br-nios2-glibc.config
@@ -2,9 +2,8 @@ BR2_nios2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-openrisc-uclibc.config b/support/config-fragments/autobuild/br-openrisc-uclibc.config
index a346c83e4c..b3cf2d08ae 100644
--- a/support/config-fragments/autobuild/br-openrisc-uclibc.config
+++ b/support/config-fragments/autobuild/br-openrisc-uclibc.config
@@ -1,9 +1,9 @@
 BR2_or1k=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2018.02-925-gd4158df.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2019.11.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
index dec7b7f681..b8a568e431 100644
--- a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
+++ b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
@@ -3,8 +3,8 @@ BR2_powerpc_603e=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
index e116daadee..dc7c7d35fc 100644
--- a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
+++ b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
@@ -3,9 +3,9 @@ BR2_powerpc_e500mc=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
index 48686bbcf8..e7ff1a4715 100644
--- a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
@@ -2,8 +2,8 @@ BR2_powerpc64=y
 BR2_powerpc_power7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
index c12e06e195..97c7ebdb67 100644
--- a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
@@ -2,8 +2,8 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv32.config b/support/config-fragments/autobuild/br-riscv32.config
index e34f7b4aad..4ec6ca9f89 100644
--- a/support/config-fragments/autobuild/br-riscv32.config
+++ b/support/config-fragments/autobuild/br-riscv32.config
@@ -3,8 +3,8 @@ BR2_RISCV_32=y
 BR2_RISCV_ABI_ILP32=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-glibc-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_0=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-glibc-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv64.config b/support/config-fragments/autobuild/br-riscv64.config
index 7c98512694..0706c7b5da 100644
--- a/support/config-fragments/autobuild/br-riscv64.config
+++ b/support/config-fragments/autobuild/br-riscv64.config
@@ -2,8 +2,8 @@ BR2_riscv=y
 BR2_RISCV_ABI_LP64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-glibc-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-glibc-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-sh4-full.config b/support/config-fragments/autobuild/br-sh4-full.config
index a2c7d0fed7..5e358bb82a 100644
--- a/support/config-fragments/autobuild/br-sh4-full.config
+++ b/support/config-fragments/autobuild/br-sh4-full.config
@@ -2,9 +2,9 @@ BR2_sh=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-sparc-uclibc.config b/support/config-fragments/autobuild/br-sparc-uclibc.config
index 13e81804a2..74b4bf27eb 100644
--- a/support/config-fragments/autobuild/br-sparc-uclibc.config
+++ b/support/config-fragments/autobuild/br-sparc-uclibc.config
@@ -1,8 +1,8 @@
 BR2_sparc=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-sparc64-glibc.config b/support/config-fragments/autobuild/br-sparc64-glibc.config
index 293d477c95..75c31ad5cb 100644
--- a/support/config-fragments/autobuild/br-sparc64-glibc.config
+++ b/support/config-fragments/autobuild/br-sparc64-glibc.config
@@ -1,8 +1,8 @@
 BR2_sparc64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-x86-64-core2-full.config b/support/config-fragments/autobuild/br-x86-64-core2-full.config
index 7220244442..8bab1deb17 100644
--- a/support/config-fragments/autobuild/br-x86-64-core2-full.config
+++ b/support/config-fragments/autobuild/br-x86-64-core2-full.config
@@ -3,9 +3,9 @@ BR2_x86_core2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-x86-64-musl.config b/support/config-fragments/autobuild/br-x86-64-musl.config
index 7d673f42ec..c67a524744 100644
--- a/support/config-fragments/autobuild/br-x86-64-musl.config
+++ b/support/config-fragments/autobuild/br-x86-64-musl.config
@@ -3,8 +3,8 @@ BR2_x86_atom=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-xtensa-full.config b/support/config-fragments/autobuild/br-xtensa-full.config
index 4057e624db..3d57b99c3c 100644
--- a/support/config-fragments/autobuild/br-xtensa-full.config
+++ b/support/config-fragments/autobuild/br-xtensa-full.config
@@ -1,9 +1,9 @@
 BR2_xtensa=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2019.05.1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2019.11.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
-- 
2.24.1
