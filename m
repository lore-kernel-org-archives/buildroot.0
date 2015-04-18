From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 18 Apr 2015 14:52:43 +0200
Subject: [Buildroot] [PATCH 1/4] boot/uboot: bump to version 2015.04
Message-ID: <1429361566-3538-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 03e6acc..7cf695c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2015.01"
+	bool "2015.04"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -63,7 +63,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2015.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2015.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-- 
2.3.5
