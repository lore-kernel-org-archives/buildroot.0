From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 Sep 2020 12:47:01 -0300
Subject: [Buildroot] [PATCH] configs/imx6-sabresd: Bump U-Boot and kernel
 versions
Message-ID: <20200922154701.6393-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2020.07 version and kernel to 5.4.63.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabresd_defconfig     | 4 ++--
 configs/imx6-sabresd_qt5_defconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index d244c5961a..574816f7d6 100644
--- a/configs/imx6-sabresd_defconfig
+++ b/configs/imx6-sabresd_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.63"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index df50990dc6..b521f20ee0 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -30,7 +30,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -38,7 +38,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.63"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
-- 
2.17.1
