From: Jan Sarenik <jasan@jasan.tk>
Date: Tue,  2 Feb 2016 11:06:04 +0100
Subject: [Buildroot] [PATCH 1/1] Update freescale_imx6qsabreauto_defconfig
Message-ID: <1454407564-6117-1-git-send-email-jan.sarenik@ysoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Sarenik <jan.sarenik@ysoft.com>
---
 configs/freescale_imx6qsabreauto_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 70367a7..38af560 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,4 +32,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
-- 
2.7.0
