From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 21 Sep 2019 18:00:09 +0300
Subject: [Buildroot] [PATCH 5/5] configs/solidrun_macchiatobin_marvell: drop
 platform for Marvell binaries
In-Reply-To: <20190921150009.3267612-1-geomatsi@gmail.com>
References: <20190921150009.3267612-1-geomatsi@gmail.com>
Message-ID: <20190921150009.3267612-6-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated binaries-marvell package provides common firmware
supporting both A7K and A8K. So no need to specify
platform for binaries-marvell package anymore.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/solidrun_macchiatobin_marvell_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
index 4b52e47945..4d269b9f75 100644
--- a/configs/solidrun_macchiatobin_marvell_defconfig
+++ b/configs/solidrun_macchiatobin_marvell_defconfig
@@ -14,7 +14,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
 BR2_TARGET_BINARIES_MARVELL=y
-BR2_TARGET_BINARIES_MARVELL_8040=y
 BR2_TARGET_MV_DDR_MARVELL=y
 
 # U-Boot
-- 
2.23.0
