From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  8 Jan 2020 20:09:53 -0300
Subject: [Buildroot] [PATCH 1/2] boot/uboot: Bump to version 2020.01
Message-ID: <20200108230954.23969-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to U-Boot 2020.01 version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 42f2090787..ffc441d670 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2019.10"
+	bool "2020.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -89,7 +89,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2019.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2020.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 1dd2456449..6c17ef02b2 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014  u-boot-2019.10.tar.bz2
+sha256  aa453c603208b1b27bd03525775a7f79b443adec577fdc6e8f06974025a135f1  u-boot-2020.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.17.1
