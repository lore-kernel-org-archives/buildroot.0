From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:00:30 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: update
 pre-built Buildroot toolchains
Message-ID: <20180630155829.28675835CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edca2cd08664eb234c0b7dfcbd04991aa4c1c281
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All pre-built Buildroot toolchains have been rebuilt with Buildroot
2018.05, so this commit updates the corresponding configuration
fragments to make sure the autobuilders use the new toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-aarch64-glibc.config            | 2 +-
 support/config-fragments/autobuild/br-arm-basic.config                | 2 +-
 support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config      | 2 +-
 support/config-fragments/autobuild/br-arm-cortex-a9-musl.config       | 2 +-
 support/config-fragments/autobuild/br-arm-cortex-m4-full.config       | 2 +-
 support/config-fragments/autobuild/br-arm-full-nothread.config        | 2 +-
 support/config-fragments/autobuild/br-arm-full-static.config          | 2 +-
 support/config-fragments/autobuild/br-arm-full.config                 | 2 +-
 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config    | 2 +-
 support/config-fragments/autobuild/br-i386-pentium4-full.config       | 2 +-
 support/config-fragments/autobuild/br-m68k-5208-full.config           | 2 +-
 support/config-fragments/autobuild/br-m68k-68040-full.config          | 2 +-
 support/config-fragments/autobuild/br-microblazeel-full.config        | 2 +-
 support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config     | 2 +-
 support/config-fragments/autobuild/br-mips64-n64-full.config          | 2 +-
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config     | 2 +-
 support/config-fragments/autobuild/br-mipsel-o32-full.config          | 2 +-
 support/config-fragments/autobuild/br-nios2-glibc.config              | 2 +-
 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config   | 2 +-
 support/config-fragments/autobuild/br-powerpc-e500mc-full.config      | 2 +-
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config   | 2 +-
 support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config | 2 +-
 support/config-fragments/autobuild/br-sh4-full.config                 | 2 +-
 support/config-fragments/autobuild/br-sparc-uclibc.config             | 2 +-
 support/config-fragments/autobuild/br-sparc64-glibc.config            | 2 +-
 support/config-fragments/autobuild/br-x86-64-core2-full.config        | 2 +-
 support/config-fragments/autobuild/br-x86-64-musl.config              | 2 +-
 support/config-fragments/autobuild/br-xtensa-full.config              | 2 +-
 28 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/support/config-fragments/autobuild/br-aarch64-glibc.config b/support/config-fragments/autobuild/br-aarch64-glibc.config
index 71b3a26356..19c9473a75 100644
--- a/support/config-fragments/autobuild/br-aarch64-glibc.config
+++ b/support/config-fragments/autobuild/br-aarch64-glibc.config
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
index e77d5e9ecc..eadf78f717 100644
--- a/support/config-fragments/autobuild/br-arm-basic.config
+++ b/support/config-fragments/autobuild/br-arm-basic.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
index 160484dfb4..f67d955e88 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
@@ -4,7 +4,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
index 19ee4174f2..8db615c13b 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
@@ -4,7 +4,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
index 6a299922c6..1ce4bdc5be 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
@@ -3,7 +3,7 @@ BR2_cortex_m4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
index 6433d072de..1120f4619e 100644
--- a/support/config-fragments/autobuild/br-arm-full-nothread.config
+++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
@@ -3,7 +3,7 @@ BR2_arm1176jzf_s=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
index 443d3fa6f4..157fc02223 100644
--- a/support/config-fragments/autobuild/br-arm-full-static.config
+++ b/support/config-fragments/autobuild/br-arm-full-static.config
@@ -3,7 +3,7 @@ BR2_STATIC_LIBS=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-arm-full.config b/support/config-fragments/autobuild/br-arm-full.config
index 72052a0772..07c773e90e 100644
--- a/support/config-fragments/autobuild/br-arm-full.config
+++ b/support/config-fragments/autobuild/br-arm-full.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
index a6eb584526..9eee780799 100644
--- a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
+++ b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
@@ -2,7 +2,7 @@ BR2_x86_pentium_mmx=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
diff --git a/support/config-fragments/autobuild/br-i386-pentium4-full.config b/support/config-fragments/autobuild/br-i386-pentium4-full.config
index 7abd54927d..e7a97351c3 100644
--- a/support/config-fragments/autobuild/br-i386-pentium4-full.config
+++ b/support/config-fragments/autobuild/br-i386-pentium4-full.config
@@ -2,7 +2,7 @@ BR2_x86_pentium4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-m68k-5208-full.config b/support/config-fragments/autobuild/br-m68k-5208-full.config
index b8ea08e868..3f809ea4a5 100644
--- a/support/config-fragments/autobuild/br-m68k-5208-full.config
+++ b/support/config-fragments/autobuild/br-m68k-5208-full.config
@@ -2,7 +2,7 @@ BR2_m68k=y
 BR2_m68k_cf5208=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-m68k-68040-full.config b/support/config-fragments/autobuild/br-m68k-68040-full.config
index ca9753379b..27ce4e3490 100644
--- a/support/config-fragments/autobuild/br-m68k-68040-full.config
+++ b/support/config-fragments/autobuild/br-m68k-68040-full.config
@@ -1,7 +1,7 @@
 BR2_m68k=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-microblazeel-full.config b/support/config-fragments/autobuild/br-microblazeel-full.config
index 4bb5f2adff..8c4778770b 100644
--- a/support/config-fragments/autobuild/br-microblazeel-full.config
+++ b/support/config-fragments/autobuild/br-microblazeel-full.config
@@ -1,7 +1,7 @@
 BR2_microblazeel=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
index 1ed280f7a7..818f99e536 100644
--- a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
@@ -4,7 +4,7 @@ BR2_mips_32r6=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-mips64-n64-full.config b/support/config-fragments/autobuild/br-mips64-n64-full.config
index e90f5d56fe..ca625c9e4b 100644
--- a/support/config-fragments/autobuild/br-mips64-n64-full.config
+++ b/support/config-fragments/autobuild/br-mips64-n64-full.config
@@ -3,7 +3,7 @@ BR2_MIPS_NABI64=y
 # BR2_MIPS_SOFT_FLOAT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
index bb15d3168c..96a333c6b2 100644
--- a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
@@ -5,7 +5,7 @@ BR2_MIPS_NABI64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-mipsel-o32-full.config b/support/config-fragments/autobuild/br-mipsel-o32-full.config
index b985dbb8a8..aae01a919b 100644
--- a/support/config-fragments/autobuild/br-mipsel-o32-full.config
+++ b/support/config-fragments/autobuild/br-mipsel-o32-full.config
@@ -2,7 +2,7 @@ BR2_mipsel=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-nios2-glibc.config b/support/config-fragments/autobuild/br-nios2-glibc.config
index 1e10e34a76..be5cb7e29d 100644
--- a/support/config-fragments/autobuild/br-nios2-glibc.config
+++ b/support/config-fragments/autobuild/br-nios2-glibc.config
@@ -2,7 +2,7 @@ BR2_nios2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
index 71694eee13..37c3989b5b 100644
--- a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
+++ b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
@@ -3,7 +3,7 @@ BR2_powerpc_603e=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
index 5f2a513904..08cb3f382e 100644
--- a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
+++ b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
@@ -3,7 +3,7 @@ BR2_powerpc_e500mc=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
index 6be80574a0..bc99682637 100644
--- a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
@@ -2,7 +2,7 @@ BR2_powerpc64=y
 BR2_powerpc_power7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
index 48c47621d9..15703e60d1 100644
--- a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
@@ -2,7 +2,7 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-sh4-full.config b/support/config-fragments/autobuild/br-sh4-full.config
index 87796fb65e..018706d9e6 100644
--- a/support/config-fragments/autobuild/br-sh4-full.config
+++ b/support/config-fragments/autobuild/br-sh4-full.config
@@ -2,7 +2,7 @@ BR2_sh=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-sparc-uclibc.config b/support/config-fragments/autobuild/br-sparc-uclibc.config
index 4b6b819578..2e13937b93 100644
--- a/support/config-fragments/autobuild/br-sparc-uclibc.config
+++ b/support/config-fragments/autobuild/br-sparc-uclibc.config
@@ -1,7 +1,7 @@
 BR2_sparc=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-sparc64-glibc.config b/support/config-fragments/autobuild/br-sparc64-glibc.config
index 5dbe6df5bd..78a8216e29 100644
--- a/support/config-fragments/autobuild/br-sparc64-glibc.config
+++ b/support/config-fragments/autobuild/br-sparc64-glibc.config
@@ -1,7 +1,7 @@
 BR2_sparc64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-x86-64-core2-full.config b/support/config-fragments/autobuild/br-x86-64-core2-full.config
index 50edff5f7b..7cdb738b36 100644
--- a/support/config-fragments/autobuild/br-x86-64-core2-full.config
+++ b/support/config-fragments/autobuild/br-x86-64-core2-full.config
@@ -3,7 +3,7 @@ BR2_x86_core2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-x86-64-musl.config b/support/config-fragments/autobuild/br-x86-64-musl.config
index 6f5b23d301..5a59485aad 100644
--- a/support/config-fragments/autobuild/br-x86-64-musl.config
+++ b/support/config-fragments/autobuild/br-x86-64-musl.config
@@ -3,7 +3,7 @@ BR2_x86_atom=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
diff --git a/support/config-fragments/autobuild/br-xtensa-full.config b/support/config-fragments/autobuild/br-xtensa-full.config
index d60a71a192..44845cd326 100644
--- a/support/config-fragments/autobuild/br-xtensa-full.config
+++ b/support/config-fragments/autobuild/br-xtensa-full.config
@@ -1,7 +1,7 @@
 BR2_xtensa=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2018.05.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
