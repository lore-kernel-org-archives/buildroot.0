From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 08:40:25 +0100
Subject: [Buildroot] [git commit] olimex_imx233_olinuxino: bump versions
Message-ID: <20170314074057.A4FD382556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=569b1ac77caa23b5d454ec7887c48bb6d63c1678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/olimex_imx233_olinuxino_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index e5e6605..1b35b74 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.14"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/imx233_olinuxino/linux-wifi.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -40,7 +40,7 @@ BR2_TARGET_ROOTFS_EXT4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.03"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
 BR2_TARGET_UBOOT_FORMAT_SD=y
  
