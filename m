From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jan 2018 22:53:55 +0100
Subject: [Buildroot] [PATCH] configs/sheevaplug_defconfig: bump linux kernel
 to 4.14.13
Message-ID: <20180114215355.3765-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sheevaplug_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 9d6244424e..edafffe0a0 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -11,8 +11,8 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
 
-# Linux headers same as kernel, a 4.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -26,7 +26,7 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.11.0
