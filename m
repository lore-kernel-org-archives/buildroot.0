From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Oct 2013 17:10:52 -0300
Subject: [Buildroot] [PATCH 1/2] u-boot: bump to version 2013.10
Message-ID: <1382040653-17972-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 998cda2..7a20d06 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2013.07"
+	bool "2013.10"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
        bool "Custom version"
@@ -46,7 +46,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2013.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2013.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default $BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
-- 
1.8.1.5
