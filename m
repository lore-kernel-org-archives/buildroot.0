From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 25 Oct 2016 14:21:40 -0200
Subject: [Buildroot] [PATCH 2/2] configs/imx28evk: Update U-Boot and kernel
	versions
In-Reply-To: <1477412500-18757-1-git-send-email-fabio.estevam@nxp.com>
References: <1477412500-18757-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1477412500-18757-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update U-Boot to 2016.09.01 and kernel to 4.8.4 version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/freescale_imx28evk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index 9a430f7..a638462 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 3.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -11,7 +11,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.4"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-evk"
@@ -20,5 +20,5 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-evk"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx28evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_FORMAT_SD=y
-- 
2.7.4
