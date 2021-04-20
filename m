From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 21:33:31 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabresd: bump U-Boot and
 kernel versions
Message-ID: <20210420194152.2A77B8419A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=769d053f65e011c4d4d4aee565b1be4a75ccb14b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to U-Boot 2021.04 and kernel 5.10.25 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/imx6-sabresd_defconfig     | 4 ++--
 configs/imx6-sabresd_qt5_defconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index c0dce1ce62..5a39f333d1 100644
--- a/configs/imx6-sabresd_defconfig
+++ b/configs/imx6-sabresd_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.25"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index b23dd90192..8cdc0e2544 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -30,7 +30,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -38,7 +38,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.25"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
