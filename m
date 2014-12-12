From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:16:06 +0100
Subject: [Buildroot] [PATCH 09/14] boot/uboot/Config.in: Fix
	BR2_TARGET_UBOOT_SPL_NAME
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-10-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Point out that the SPL name is an image name.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 boot/uboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 801ea2d..5ba34c0 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -243,7 +243,7 @@ config BR2_TARGET_UBOOT_SPL
 	  into DDR.
 
 config BR2_TARGET_UBOOT_SPL_NAME
-	string "U-Boot SPL target name"
+	string "U-Boot SPL binary image name"
 	default "spl/u-boot-spl.bin"
 	depends on BR2_TARGET_UBOOT_SPL
 	help
-- 
2.1.3
