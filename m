From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  8 Dec 2017 14:13:38 +0100
Subject: [Buildroot] [PATCH] boot: uboot: fix typo
Message-ID: <20171208131338.11603-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Replace "depend" with "depends".

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 boot/uboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 6331bcde08..2829d2ca5e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -161,7 +161,7 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSSL
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
-	depend on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
+	depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 	help
 	  Some specific platforms (such as Allwinner A64/H5)
-- 
2.11.0
