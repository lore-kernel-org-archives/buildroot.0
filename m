From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 11 Jul 2016 17:43:05 -0300
Subject: [Buildroot] [PATCH 1/2] boot/uboot: bump to version 2016.07
Message-ID: <1468269786-23212-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a468548..b024b66 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -38,7 +38,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2016.05"
+	bool "2016.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -86,7 +86,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2016.05"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2016.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 2076b3b..cf27e90 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  87d02275615aaf0cd007b54cbe9fbadceef2bee7c79e6c323ea1ae8956dcb171  u-boot-2016.05.tar.bz2
+sha256  974fb7225c0af6a721307631f66b81e20dbda82a4d7cc32aba2a625727231253  u-boot-2016.07.tar.bz2
-- 
1.9.1
