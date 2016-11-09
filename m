From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed,  9 Nov 2016 14:27:39 +0100
Subject: [Buildroot] [PATCH 1/1] olimex_a20_olinuxino_lime2: dump U-Boot to
	2016.05
Message-ID: <20161109132739.7861-1-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch fixes build by GCC 5 (unsupported by the older U-Boot).

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 57dda72..87fc674 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.9.3
