From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Mar 2017 16:44:22 -0300
Subject: [Buildroot] [PATCH 1/2] boot/uboot: bump to version 2017.03
Message-ID: <1489434263-2383-1-git-send-email-festevam@gmail.com>
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
index 5601e01..7a73877 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -38,7 +38,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2017.01"
+	bool "2017.03"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -86,7 +86,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2017.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2017.03"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 5473cfe..9606d9f 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  6c425175f93a4bcf2ec9faf5658ef279633dbd7856a293d95bd1ff516528ecf2  u-boot-2017.01.tar.bz2
+sha256  f54baf3f9325bf444c7905f3a5b6f83680edb1e6e1a4d5f8a5ad80abe885113f  u-boot-2017.03.tar.bz2
-- 
2.7.4
