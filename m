From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 22:41:38 +0200
Subject: [Buildroot] [git commit] packages/devmem2: remove from all board
 configurations
Message-ID: <20190812205958.401A581E31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59856480b65f9a2e96a95410111429d7c0346189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not used by any other application selected by those defconfigs.

Tested building all boards and searching recursively for devmem2 in the
target directory.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/at91sam9x5ek_dev_defconfig               | 1 -
 configs/at91sam9x5ek_mmc_dev_defconfig           | 1 -
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 1 -
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 1 -
 configs/atmel_sama5d3_xplained_dev_defconfig     | 1 -
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 1 -
 configs/atmel_sama5d4_xplained_dev_defconfig     | 1 -
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 1 -
 8 files changed, 8 deletions(-)

diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index 7c29361e8a..4257dd5642 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -47,7 +47,6 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
-BR2_PACKAGE_DEVMEM2=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index a085a48c4e..2e12038544 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -50,7 +50,6 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
-BR2_PACKAGE_DEVMEM2=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index da4a0fa155..7709e1e6a1 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -39,7 +39,6 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
-BR2_PACKAGE_DEVMEM2=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_RNG_TOOLS=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 36cd49c1e9..2272fcd6ff 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -53,7 +53,6 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
-BR2_PACKAGE_DEVMEM2=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index 2a1a722960..feac379701 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -49,7 +49,6 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
-BR2_PACKAGE_DEVMEM2=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index e455702b33..6733288eff 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -52,7 +52,6 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
-BR2_PACKAGE_DEVMEM2=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 2f05628a2d..4aaf767412 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -50,7 +50,6 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
-BR2_PACKAGE_DEVMEM2=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index 2ae1999c45..828085c7b5 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -53,7 +53,6 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
-BR2_PACKAGE_DEVMEM2=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
