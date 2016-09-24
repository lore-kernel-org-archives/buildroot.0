From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 24 Sep 2016 12:33:03 -0300
Subject: [Buildroot] [PATCH 3/3] configs/imx: Bump to U-Boot 2016.09.01
In-Reply-To: <1474731183-14968-1-git-send-email-festevam@gmail.com>
References: <1474731183-14968-1-git-send-email-festevam@gmail.com>
Message-ID: <1474731183-14968-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

2016.09.01 is a bugfix release, so bump to this version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/imx6ulpico_defconfig | 2 +-
 configs/mx6cubox_defconfig   | 2 +-
 configs/wandboard_defconfig  | 2 +-
 configs/warp7_defconfig      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index f984bf4..67058f8 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -36,7 +36,7 @@ BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="pico-imx6ul"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # required tools to create the eMMC image
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index e27a2bb..b288ed7 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6cuboxi"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 4149ecf..7b075e4 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="wandboard"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 967df8e..63a9592 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7_secure"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # wifi firmware for brcm43430
-- 
2.7.4
