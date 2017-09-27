From: Breno Lima <breno.lima@nxp.com>
Date: Wed, 27 Sep 2017 09:57:12 -0300
Subject: [Buildroot] [PATCH] configs/mx6sx_udoo_neo: Bump Kernel and U-Boot
	versions
Message-ID: <1506517032-4032-1-git-send-email-breno.lima@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2017.09 and kernel to 4.13.3 versions.

Signed-off-by: Breno Lima <breno.lima@nxp.com>
---
 configs/mx6sx_udoo_neo_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index b7475d7..e2e36b9 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 4.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/neo/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/neo/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -12,13 +12,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo_neo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.3"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-udoo-neo-basic imx6sx-udoo-neo-full imx6sx-udoo-neo-extended"
-- 
2.7.4
