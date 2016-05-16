From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 May 2016 23:27:56 +0200
Subject: [Buildroot] [git commit branch/next] sheevaplug: defconfig: use 4.6
	kernel, u-boot 2016.05
Message-ID: <20160516213612.75DCA81999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a8b32febf0584d534efbb79c735888216983e8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sheevaplug_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 3632ed0..9d62444 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -11,22 +11,22 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sheevaplug"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
 BR2_TARGET_UBOOT_FORMAT_KWB=y
 # BR2_TARGET_UBOOT_NETWORK is not set
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
