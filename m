From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:56:53 +0100
Subject: [Buildroot] [PATCH 13/14] configs: freescale_imx6*: bump version to
	3.14.52-1.1.0_ga
In-Reply-To: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458140214-22303-14-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Consolidated GA support i.MX 6Q/QP/D/S/SL/UL and 7Dual

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/9f206ec7
https://github.com/Freescale/meta-fsl-arm/commit/33d1115d

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 configs/freescale_imx6dlsabreauto_defconfig | 4 ++--
 configs/freescale_imx6dlsabresd_defconfig   | 4 ++--
 configs/freescale_imx6qsabresd_defconfig    | 4 ++--
 configs/freescale_imx6sololiteevk_defconfig | 4 ++--
 configs/freescale_imx6sxsabresd_defconfig   | 4 ++--
 configs/freescale_imx6ulevk_defconfig       | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index c3abbe3..a11bb75 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -30,4 +30,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index f3db089..49e37e6 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -30,4 +30,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 17ad1b5..558ae5a 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -30,4 +30,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 4f7d91d..28d4e46 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -27,4 +27,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index 7d8e815..4a97021 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,5 +29,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
index 8359206..9d63a75 100644
--- a/configs/freescale_imx6ulevk_defconfig
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="imx_3.14.38_6ul_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="imx_v2015.04_3.14.38_6ul_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # required tools to create the microSD image
-- 
2.7.0
