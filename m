From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 14:32:02 +0100
Subject: [Buildroot] [git commit] boot: uboot: fix typo
Message-ID: <20171208132453.AED8882957@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc144ee4eba6f7342b52b9e4bf0d0b6b5633df05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace "depend" with "depends".

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 6331bcd..2829d2c 100644
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
