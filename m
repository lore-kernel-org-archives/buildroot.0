From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Tue,  5 Jan 2021 16:24:17 +0100
Subject: [Buildroot] [PATCH v2 5/8] configs/freescale_imx6*: bump BSP
 components to 5.4.70_2.3.0
In-Reply-To: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
Message-ID: <20210105152420.26379-6-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
[run-tested on i.MX6Q SabreSD, build-tested only for other configs]
Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 configs/freescale_imx6dlsabreauto_defconfig | 4 ++--
 configs/freescale_imx6dlsabresd_defconfig   | 4 ++--
 configs/freescale_imx6qsabreauto_defconfig  | 4 ++--
 configs/freescale_imx6qsabresd_defconfig    | 4 ++--
 configs/freescale_imx6sxsabresd_defconfig   | 4 ++--
 configs/freescale_imx6ullevk_defconfig      | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 623a714533..443dc92fb6 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
@@ -40,5 +40,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 98adb6ebdb..488ceef468 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
@@ -39,5 +39,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 4c2a2410a2..1a0c96d52c 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
@@ -40,5 +40,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 775082c0a5..19d7173300 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
@@ -40,5 +40,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index bf7986701c..1628d7c5a5 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb"
@@ -38,6 +38,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index 39edc6f961..88d095d400 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
@@ -17,7 +17,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.70_2.3.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.29.2
