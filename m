From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 21:41:20 +0200
Subject: [Buildroot] [git commit] configs/orangepi_lite: Bump kernel and
 U-Boot versions
Message-ID: <20180611194200.15D0688285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b0bc52cdd254966bb909b88ef4e94486f361a95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel to version 4.17 and U-Boot to 2018.05.

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_lite_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index 1e5fca8677..109861f21c 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Lite"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Lite"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-lite/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
