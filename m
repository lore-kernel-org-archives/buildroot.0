From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat, 28 May 2016 17:45:02 -0300
Subject: [Buildroot] [PATCH 1/1] configs: cubieboard2: use 4.6 kernel,
	u-boot 2016.05
Message-ID: <20160528204502.30885-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated image was tested in a Cubieboard2.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 configs/cubieboard2_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index a3b1b85..353aaa5 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,8 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/cubietech/cubieboard2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.8.3
