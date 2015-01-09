From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Jan 2015 09:41:29 -0300
Subject: [Buildroot] [PATCH] configs/olimex_imx233_olinuxino: bump kernel to
	version 3.18.2
Message-ID: <1420807289-12458-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../imx233_olinuxino/{linux-3.17.config => linux-3.18.config}     | 0
 configs/olimex_imx233_olinuxino_defconfig                         | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/olimex/imx233_olinuxino/{linux-3.17.config => linux-3.18.config} (100%)

diff --git a/board/olimex/imx233_olinuxino/linux-3.17.config b/board/olimex/imx233_olinuxino/linux-3.18.config
similarity index 100%
rename from board/olimex/imx233_olinuxino/linux-3.17.config
rename to board/olimex/imx233_olinuxino/linux-3.18.config
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index cbe4504..49a9f0f 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -15,8 +15,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
+BR2_DEFAULT_KERNEL_VERSION="3.18.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Bootloader
 BR2_TARGET_MXS_BOOTLETS=y
@@ -27,9 +27,9 @@ BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME="imx23_olinuxino_dev"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.17.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.18.config"
 BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
 
-- 
2.0.5
