From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Nov 2019 15:27:28 +0100
Subject: [Buildroot] [git commit] configs/imx28evk: Bump U-Boot and kernel
 versions
Message-ID: <20191101142054.C009C8E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=084df1f06a7fb39c19aaf673360bb3914151fa8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to 2019.10 and kernel to 5.3.8 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx28evk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index ba17ed217c..b0a0c15ef8 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 4.17 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+# Linux headers same as kernel, a 5.3 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -11,7 +11,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.8"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-evk"
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-evk"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx28evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_FORMAT_SD=y
 
 # Filesystem
