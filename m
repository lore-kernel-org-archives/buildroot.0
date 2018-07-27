From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 09:18:59 +0200
Subject: [Buildroot] [git commit] uboot: bump to version 2018.07
Message-ID: <20180727071335.3518B8A47A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d4f28f768548908895ee96e680887812991090f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7f8291abe8..f0166e382b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -39,7 +39,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2018.05"
+	bool "2018.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -87,7 +87,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2018.05"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2018.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 17840d8d9b..97d0bd0b5f 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  4da13c2a6139a78cc08608f21fd4741db27eda336cfad7ab8264fda923b9c048  u-boot-2018.05.tar.bz2
+sha256  9f10df88bc91b35642e461217f73256bbaeeca9ae2db8db56197ba5e89e1f6d4  u-boot-2018.07.tar.bz2
