From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 11:02:50 +0200
Subject: [Buildroot] [git commit] u-boot: bump to 2012.04.01 release
Message-ID: <20120429090502.B361596C08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8ff5d2990751d584d4e836b60527f97944d5ac3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump from 2012.04 to 2012.04.01
Fixes a nasty bug in the command line processing.

[Peter: keep kconfig name]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in                               |    4 ++--
 ...012.04-change-kernel-address-in-dataflash.patch |    0
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7c5f2c6..99d5623 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -17,7 +17,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_2012_04
-	bool "2012.04"
+	bool "2012.04.01"
 
 config BR2_TARGET_UBOOT_2011_12
 	bool "2011.12"
@@ -50,7 +50,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2012.04"	if BR2_TARGET_UBOOT_2012_04
+	default "2012.04.01"	if BR2_TARGET_UBOOT_2012_04
 	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
diff --git a/boot/uboot/uboot-2012.04/uboot-2012.04-change-kernel-address-in-dataflash.patch b/boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch
similarity index 100%
rename from boot/uboot/uboot-2012.04/uboot-2012.04-change-kernel-address-in-dataflash.patch
rename to boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch
