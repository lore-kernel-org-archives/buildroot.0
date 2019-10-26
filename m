From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 18:56:29 +0200
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_neo_plus2: bump
 Linux/U-Boot
Message-ID: <20191026165026.783A48869E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b114ed48617fb3cb28b6034e2e892b0112470b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This updates Linux kernel from 5.0 to 5.3.4 and U-Boot from 2019.01 to
2019.10.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/friendlyarm_nanopi_neo_plus2_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/friendlyarm_nanopi_neo_plus2_defconfig b/configs/friendlyarm_nanopi_neo_plus2_defconfig
index 6a5b36b7b1..c807b3100b 100644
--- a/configs/friendlyarm_nanopi_neo_plus2_defconfig
+++ b/configs/friendlyarm_nanopi_neo_plus2_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/friendlyarm/nanopi-neo-plus2/rootfs_overlay"
 
@@ -18,7 +18,7 @@ R2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo-plus2/boot.cmd
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo-plus2"
