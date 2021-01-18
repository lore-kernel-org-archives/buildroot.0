From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:48:45 +0100
Subject: [Buildroot] [git commit] boot/uboot: bump to version 2021.01
Message-ID: <20210118212938.47AD987F36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05e6d35fe7af0427c294e473a68c1f598af32e68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index b18216ab71..d43c85cce7 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2020.10"
+	bool "2021.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2020.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2021.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index ba6ea0bfc0..7cbd785541 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0d481bbdc05c0ee74908ec2f56a6daa53166cc6a78a0e4fac2ac5d025770a622  u-boot-2020.10.tar.bz2
+sha256  b407e1510a74e863b8b5cb42a24625344f0e0c2fc7582d8c866bd899367d0454  u-boot-2021.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
