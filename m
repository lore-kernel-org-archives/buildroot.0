From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2020 23:00:38 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] configs: fix typo
 BR2_TARGET_ROOTFS_EXT2_4
Message-ID: <20200507214107.8B5D390EAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80f3c1f49d5238eac94f37136c6537c7e087326b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The ext4 option is BR2_TARGET_ROOTFS_EXT2_4 not
BR2_TARGET_ROOTFS_EXT_4.

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a3704cd8c927401e89089b9a3d6b0ecf649f217c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
