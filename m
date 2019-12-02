From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:48 -0000
Subject: [Buildroot] [git commit] configs/orangepi-one: bump kernel and
 u-boot versions
Message-ID: <20191202083931.BCC3B8016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66a43ad96b834c591b636190bd16ea7397555204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux to 5.3.8 and U-Boot to 2019.10.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_one_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 3715f1ddbb..4863eebff3 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_One"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi One"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-one"
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
