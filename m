From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Jul 2016 23:14:45 +0200
Subject: [Buildroot] [autobuild-script] confis: update Kconfig symbols for
	sourcery toolchains
Message-ID: <1469394885-15001-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_<arch><version> symbols
has been renamed to BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_<arch> since
Buildroot only support one version of these toolchains.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 web/toolchains/configs/sourcery-arm-armv4t.config | 2 +-
 web/toolchains/configs/sourcery-arm.config        | 2 +-
 web/toolchains/configs/sourcery-mips.config       | 2 +-
 web/toolchains/configs/sourcery-mips64.config     | 2 +-
 web/toolchains/configs/sourcery-sh.config         | 2 +-
 web/toolchains/configs/sourcery-x86-64.config     | 2 +-
 web/toolchains/configs/sourcery-x86.config        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/web/toolchains/configs/sourcery-arm-armv4t.config b/web/toolchains/configs/sourcery-arm-armv4t.config
index 2450351..4c0e01f 100644
--- a/web/toolchains/configs/sourcery-arm-armv4t.config
+++ b/web/toolchains/configs/sourcery-arm-armv4t.config
@@ -1,4 +1,4 @@
 BR2_arm=y
 BR2_arm920t=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/web/toolchains/configs/sourcery-arm.config b/web/toolchains/configs/sourcery-arm.config
index fb98b28..8ade464 100644
--- a/web/toolchains/configs/sourcery-arm.config
+++ b/web/toolchains/configs/sourcery-arm.config
@@ -1,3 +1,3 @@
 BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/web/toolchains/configs/sourcery-mips.config b/web/toolchains/configs/sourcery-mips.config
index a49fe70..103e20b 100644
--- a/web/toolchains/configs/sourcery-mips.config
+++ b/web/toolchains/configs/sourcery-mips.config
@@ -1,4 +1,4 @@
 BR2_mips=y
 BR2_mips_32r2=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/web/toolchains/configs/sourcery-mips64.config b/web/toolchains/configs/sourcery-mips64.config
index d89af1c..77e3a85 100644
--- a/web/toolchains/configs/sourcery-mips64.config
+++ b/web/toolchains/configs/sourcery-mips64.config
@@ -2,4 +2,4 @@ BR2_mips64el=y
 BR2_mips_64r2=y
 BR2_MIPS_NABI64=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/web/toolchains/configs/sourcery-sh.config b/web/toolchains/configs/sourcery-sh.config
index f68373f..515fc8f 100644
--- a/web/toolchains/configs/sourcery-sh.config
+++ b/web/toolchains/configs/sourcery-sh.config
@@ -1,4 +1,4 @@
 BR2_sh=y
 BR2_sh4a=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH=y
diff --git a/web/toolchains/configs/sourcery-x86-64.config b/web/toolchains/configs/sourcery-x86-64.config
index 05bde59..646288d 100644
--- a/web/toolchains/configs/sourcery-x86-64.config
+++ b/web/toolchains/configs/sourcery-x86-64.config
@@ -1,3 +1,3 @@
 BR2_x86_64=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86=y
diff --git a/web/toolchains/configs/sourcery-x86.config b/web/toolchains/configs/sourcery-x86.config
index 4d61b86..ad629f6 100644
--- a/web/toolchains/configs/sourcery-x86.config
+++ b/web/toolchains/configs/sourcery-x86.config
@@ -1,3 +1,3 @@
 BR2_x86_pentium4=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86=y
-- 
2.5.5
