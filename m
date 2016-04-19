From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Tue, 19 Apr 2016 17:24:09 +0200
Subject: [Buildroot] [PATCH] configs: atmel: sama5d2 has vfpv4-d16
Message-ID: <1461079449-24605-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The datasheet indicates vfpv4 but it stands for vfpv4-d16 not vfpv4-32.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 configs/atmel_sama5d2_xplained_mmc_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
index c02702b..7eb969f 100644
--- a/configs/atmel_sama5d2_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
@@ -2,7 +2,6 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV4=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d2_xplained_mmc/post-image.sh"
-- 
2.5.0
