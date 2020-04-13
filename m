From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 21:55:59 +0200
Subject: [Buildroot] [git commit] boot/uboot: bump to version 2020.04
Message-ID: <20200413194153.E7E658EA8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02bddcea7d3d6d3c7ed822734e2b20e5ade71c8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://lists.denx.de/pipermail/u-boot/2020-April/406522.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index ffc441d670..7a6f5053fd 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2020.01"
+	bool "2020.04"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -89,7 +89,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2020.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2020.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 6c17ef02b2..8274246cf6 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  aa453c603208b1b27bd03525775a7f79b443adec577fdc6e8f06974025a135f1  u-boot-2020.01.tar.bz2
+sha256  fe732aaf037d9cc3c0909bad8362af366ae964bbdac6913a34081ff4ad565372  u-boot-2020.04.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
