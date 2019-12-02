From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:48 -0000
Subject: [Buildroot] [git commit] configs/orangepi_zero_plus2: bump kernel
 and u-boot versions
Message-ID: <20191202083931.DC7717FB5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0675be79c9742ecbf7ffb6637d920876bb6c7141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux to 5.3.8 and U-Boot to 2019.10.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_zero_plus2_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 4ae7ef9355..a0183714a4 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
 
@@ -18,7 +18,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
