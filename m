From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Oct 2015 10:49:21 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: bump version to 2015.10
Message-ID: <1445676562-24568-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keep the 2015.07 patch so things still work for people using 2015.07.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8643dab..b75006b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -38,7 +38,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2015.07"
+	bool "2015.10"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -83,7 +83,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2015.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2015.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-- 
2.1.4
