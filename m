From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 21:25:04 +0100
Subject: [Buildroot] [git commit] package/*/Config.in.host: fix help text
 check-package warnings
Message-ID: <20180214202523.2E7C98879A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c667c21f18776ad59c6b70842d65b009f568e451
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the warnings reported by check-package on the help
text of all package Config.in.host files, related to the formatting of
the help text: should start with a tab, then 2 spaces, then at most 62
characters.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtools/Config.in.host            | 8 ++++----
 package/omap-u-boot-utils/Config.in.host | 4 ++--
 package/pkgconf/Config.in.host           | 9 +++++----
 package/pwgen/Config.in.host             | 4 ++--
 package/qemu/Config.in.host              | 3 ++-
 package/tegrarcm/Config.in.host          | 4 ++--
 6 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/package/mtools/Config.in.host b/package/mtools/Config.in.host
index 96b332b039..42cb6f80fb 100644
--- a/package/mtools/Config.in.host
+++ b/package/mtools/Config.in.host
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_HOST_MTOOLS
 	bool "host mtools"
 	help
-	  Mtools is a collection of utilities to access MS-DOS disks from
-	  Unix without mounting them. It supports Win'95 style long file
-	  names, OS/2 Xdf disks and 2m disks (store up to 1992k on a high
-	  density 3 1/2 disk).
+	  Mtools is a collection of utilities to access MS-DOS disks
+	  from Unix without mounting them. It supports Win'95 style long
+	  file names, OS/2 Xdf disks and 2m disks (store up to 1992k on
+	  a high density 3 1/2 disk).
 
 	  http://www.gnu.org/software/mtools/
diff --git a/package/omap-u-boot-utils/Config.in.host b/package/omap-u-boot-utils/Config.in.host
index 87dcc06938..1549674f01 100644
--- a/package/omap-u-boot-utils/Config.in.host
+++ b/package/omap-u-boot-utils/Config.in.host
@@ -3,7 +3,7 @@ config BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
 	depends on BR2_arm || BR2_armeb
 	help
 	  U-Boot Utilities for Texas Instrument's OMAP platforms.
-	  This is a set of tools to control U-Boot from scripts, generate
-	  OMAP-specific signed image files and more.
+	  This is a set of tools to control U-Boot from scripts,
+	  generate OMAP-specific signed image files and more.
 
 	  https://github.com/nmenon/omap-u-boot-utils
diff --git a/package/pkgconf/Config.in.host b/package/pkgconf/Config.in.host
index 437a7bf6f9..56836a5cbf 100644
--- a/package/pkgconf/Config.in.host
+++ b/package/pkgconf/Config.in.host
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_HOST_PKGCONF
 	bool "host pkgconf"
 	help
-	  pkgconf is a program which helps to configure compiler and linker
-	  flags for development frameworks. It is similar to pkg-config,
-	  but was written from scratch in the summer of 2011 to replace
-	  pkg-config, which now needs itself to build itself
+	  pkgconf is a program which helps to configure compiler and
+	  linker flags for development frameworks. It is similar to
+	  pkg-config, but was written from scratch in the summer of
+	  2011 to replace pkg-config, which now needs itself to build
+	  itself
 
 	  https://github.com/pkgconf/pkgconf
diff --git a/package/pwgen/Config.in.host b/package/pwgen/Config.in.host
index 0c56851dcb..20b55f3fc0 100644
--- a/package/pwgen/Config.in.host
+++ b/package/pwgen/Config.in.host
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_PWGEN
 	bool "host pwgen"
 	help
-	  Pwgen is a small, GPL'ed password generator which creates passwords
-	  which can be easily memorized by a human.
+	  Pwgen is a small, GPL'ed password generator which creates
+	  passwords which can be easily memorized by a human.
 
 	  http://sourceforge.net/projects/pwgen/
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 71f38ef41f..f14bcec6d6 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -9,7 +9,8 @@ config BR2_PACKAGE_HOST_QEMU
 	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
 		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	help
-	  QEMU is a generic and open source machine emulator and virtualizer.
+	  QEMU is a generic and open source machine emulator and
+	  virtualizer.
 
 	  This option builds an emulator for your selected architecture.
 
diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
index 47590fa127..d8cbb947d6 100644
--- a/package/tegrarcm/Config.in.host
+++ b/package/tegrarcm/Config.in.host
@@ -2,7 +2,7 @@ config BR2_PACKAGE_HOST_TEGRARCM
 	bool "host tegrarcm"
 	depends on BR2_arm || BR2_armeb
 	help
-	  This program is used to send code to a Tegra device in recovery
-	  mode.
+	  This program is used to send code to a Tegra device in
+	  recovery mode.
 
 	  https://github.com/NVIDIA/tegrarcm
