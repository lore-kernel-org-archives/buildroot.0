From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Feb 2013 15:29:14 +0100
Subject: [Buildroot] [git commit] u-boot: bump 2013.01.x version
Message-ID: <20130203142937.01EF39A917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea6f3bd9f25d7a0c3e39a166036a7f8b74935a72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f10b6d0..d22e23b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_2013_01
-	bool "2013.01"
+	bool "2013.01.01"
 
 config BR2_TARGET_UBOOT_2012_10
 	bool "2012.10"
@@ -58,7 +58,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2013.01"	if BR2_TARGET_UBOOT_2013_01
+	default "2013.01.01"	if BR2_TARGET_UBOOT_2013_01
 	default "2012.10"	if BR2_TARGET_UBOOT_2012_10
 	default "2012.07"	if BR2_TARGET_UBOOT_2012_07
 	default "2012.04.01"	if BR2_TARGET_UBOOT_2012_04
