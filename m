From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Fri,  5 Apr 2019 13:09:58 +0530
Subject: [Buildroot] [PATCH 06/10] configs: orangepi_pc2: Bump to u-boot
 version 2019.01
In-Reply-To: <20190405074002.9462-1-shyam.saini@amarulasolutions.com>
References: <20190405074002.9462-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190405074002.9462-6-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/orangepi_pc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index ef760759e2..7114e62bdb 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.11.0
