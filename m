From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:48:24 +0200
Subject: [Buildroot] [git commit] */Config.in*: remove consecutive empty
 lines
Message-ID: <20180401064830.D1258814EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b6b4e36b4d73d7ca0e5fff43b718250cb5a9993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                      | 1 -
 Config.in.legacy               | 1 -
 arch/Config.in.mips            | 1 -
 boot/barebox/barebox/Config.in | 1 -
 boot/syslinux/Config.in        | 1 -
 fs/jffs2/Config.in             | 1 -
 6 files changed, 6 deletions(-)

diff --git a/Config.in b/Config.in
index a74b24ae45..852c61ef3a 100644
--- a/Config.in
+++ b/Config.in
@@ -620,7 +620,6 @@ config BR2_SHARED_STATIC_LIBS
 
 endchoice
 
-
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
 	default "$(CONFIG_DIR)/local.mk"
diff --git a/Config.in.legacy b/Config.in.legacy
index 60f9148234..b1dca97e5e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1164,7 +1164,6 @@ config BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL
 	  version provided in buildroot. And both can't coexist.
 	  It now uses OpenSSL as the only option.
 
-
 config BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE
 	bool "nginx http spdy module removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 8bb8d126e6..e45299f818 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -115,7 +115,6 @@ config BR2_mips_p6600
 	select BR2_MIPS_CPU_MIPS64R6
 endchoice
 
-
 choice
 	prompt "Target ABI"
 	default BR2_MIPS_NABI32
diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
index 0be26adf93..958e294e40 100644
--- a/boot/barebox/barebox/Config.in
+++ b/boot/barebox/barebox/Config.in
@@ -17,7 +17,6 @@ config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
 	  Name of the board for which Barebox should be built, without
 	  the _defconfig suffix.
 
-
 config BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE
 	string "Configuration file path"
 	depends on BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index da035498de..e969d53fd0 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -48,7 +48,6 @@ config BR2_TARGET_SYSLINUX_EFI
 	help
 	  Install the 'efi' image, to boot from an EFI environment.
 
-
 if BR2_TARGET_SYSLINUX_LEGACY_BIOS
 
 config BR2_TARGET_SYSLINUX_C32
diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index 1010216bd1..f1703f4edd 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -98,7 +98,6 @@ config BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
 	  the flash memory page size.  Using this option is only needed if Linux is
 	  configured to use a page size different than 4kB.
 
-
 config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE
 	hex "Virtual memory page size"
 	depends on BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
