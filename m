From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 21:10:16 +0200
Subject: [Buildroot] [git commit] configs/orangepi_zero: bump Linux to
 4.19.38, U-boot to 2019.04
Message-ID: <20190505190727.8ACF18822E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5754df13c0e46ba9d6b426debbf2fb43c8f16039
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_zero_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 3c65665cd1..d1c6c8f7a7 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.38"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
