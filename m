From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Tue, 20 Apr 2021 23:18:18 +0200
Subject: [Buildroot] [PATCH 1/4] configs/freescale_imx6*: bump BSP
 components to lf-5.10.y-1.0.0
In-Reply-To: <20210420211821.31616-1-stephane.viau@oss.nxp.com>
References: <20210420211821.31616-1-stephane.viau@oss.nxp.com>
Message-ID: <20210420211821.31616-2-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump ATF, U-Boot and Linux kernel to the NXP BSP 5.10.y-1.0.0 versions.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 configs/freescale_imx6dlsabreauto_defconfig | 8 ++++----
 configs/freescale_imx6dlsabresd_defconfig   | 8 ++++----
 configs/freescale_imx6qsabreauto_defconfig  | 8 ++++----
 configs/freescale_imx6qsabresd_defconfig    | 8 ++++----
 configs/freescale_imx6sxsabresd_defconfig   | 8 ++++----
 configs/freescale_imx6ullevk_defconfig      | 6 +++---
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 443dc92fb6..8fe10f6275 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
@@ -40,5 +40,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 488ceef468..74debbfd46 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
@@ -39,5 +39,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 1a0c96d52c..58b4a5f92d 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
@@ -40,5 +40,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 19d7173300..f2ac993da0 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
@@ -40,5 +40,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index 1628d7c5a5..9f48ef2da5 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb"
@@ -38,6 +38,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index 88d095d400..4c5c3b2524 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
@@ -17,7 +17,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.31.0
