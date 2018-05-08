From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:08:46 +0200
Subject: [Buildroot] [git commit] configs/mx53loco: Bump kernel and U-Boot
 versions
Message-ID: <20180508130840.09B068B8E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0998275a3ad679b8410ec67ad14b4eb356574904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel to version 4.16.7 and U-Boot to 2018.05.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/mx53loco_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 8bb4014178..16dde351bd 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_cortex_a8=y
 
 # Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx53loco"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx53-qsb imx53-qsrb"
