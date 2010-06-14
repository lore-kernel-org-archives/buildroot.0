From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: beautify option prompts
Message-ID: <20100614203437.F225780E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8f07a596113f5ae1aea9cefcfa27aeab6b9348e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 79c5c3d..00fd03a 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -1,11 +1,11 @@
 menuconfig BR2_TARGET_UBOOT
-	bool "Das U-Boot Boot Monitor"
+	bool "U-Boot"
 	help
 	  Build "Das U-Boot" Boot Monitor
 
 if BR2_TARGET_UBOOT
 config BR2_TARGET_UBOOT_BOARDNAME
-	string "board name"
+	string "U-Boot board name"
 	help
 	  One of U-Boot supported boards to be built.
 	  This will be suffixed with _config to meet U-Boot standard naming.
@@ -17,13 +17,13 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_2010_03
-	bool "u-boot-2010.03"
+	bool "2010.03"
 
 config BR2_TARGET_UBOOT_2009_11
-	bool "u-boot-2009.11"
+	bool "2009.11"
 
 config BR2_TARGET_UBOOT_2009_08
-	bool "u-boot-2009.08"
+	bool "2009.08"
 
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
-- 
1.7.1
