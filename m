From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:01:04 +0200
Subject: [Buildroot] [git commit] configs: fix typo BR2_TARGET_ROOTFS_EXT2_4
Message-ID: <20200421195434.1BF488FB42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3704cd8c927401e89089b9a3d6b0ecf649f217c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ext4 option is BR2_TARGET_ROOTFS_EXT2_4 not
BR2_TARGET_ROOTFS_EXT_4.

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_imx28evk_defconfig      | 2 +-
 configs/imx23evk_defconfig                | 2 +-
 configs/olimex_imx233_olinuxino_defconfig | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index b0a0c15ef8..520c63f673 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT_FORMAT_SD=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT4=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 
 # To generate SD Image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/imx23evk_defconfig b/configs/imx23evk_defconfig
index 87610d1b72..b5bfc849b4 100644
--- a/configs/imx23evk_defconfig
+++ b/configs/imx23evk_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT_FORMAT_SD=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT4=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 
 # To generate SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 26e5ad1393..275dd98afe 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -33,7 +33,7 @@ BR2_PACKAGE_ZD1211_FIRMWARE=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT4=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # U-Boot
