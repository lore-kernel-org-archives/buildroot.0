From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 23:45:45 +0100
Subject: [Buildroot] [git commit] boot/uboot: bump to version 2016.03
Message-ID: <20160314225224.DF9CA817A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2790748a1129564207c0ca0a20475728c898b866
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 4a6dc56..f1d3d2a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -38,7 +38,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2016.01"
+	bool "2016.03"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -83,7 +83,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2016.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2016.03"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 31b0db9..747d133 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  e5792fba9399d9804aa2ef667f14ff771e2cdece72367d340250265bf095a5d5  u-boot-2016.01.tar.bz2
+sha256  e49337262ecac44dbdeac140f2c6ebd1eba345e0162b0464172e7f05583ed7bb  u-boot-2016.03.tar.bz2
