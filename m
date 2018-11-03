From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat,  3 Nov 2018 18:26:05 +0530
Subject: [Buildroot] [PATCH 1/4] uboot: bump to version 2018.09
Message-ID: <20181103125608.2255-1-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 9e40c11fa1..ac6f8bc8c1 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -39,7 +39,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2018.07"
+	bool "2018.09"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -87,7 +87,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2018.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2018.09"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 97d0bd0b5f..ea07fb584d 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  9f10df88bc91b35642e461217f73256bbaeeca9ae2db8db56197ba5e89e1f6d4  u-boot-2018.07.tar.bz2
+sha256  839bf23cfe8ce613a77e583a60375179d0ad324e92c82fbdd07bebf0fd142268  u-boot-2018.09.tar.bz2
-- 
2.18.0.321.gffc6fa0e3
