From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 12 Sep 2017 05:41:42 +0200
Subject: [Buildroot] [PATCH 2/2] olimex_imx233_olinuxino: bump versions
In-Reply-To: <20170912034142.12942-1-francois.perrad@gadz.org>
References: <20170912034142.12942-1-francois.perrad@gadz.org>
Message-ID: <20170912034142.12942-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_imx233_olinuxino_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index d4b154ae6..8ee89ffab 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.49"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/imx233_olinuxino/linux-wifi.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -40,7 +40,7 @@ BR2_TARGET_ROOTFS_EXT4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
 BR2_TARGET_UBOOT_FORMAT_SD=y
  
-- 
2.11.0
