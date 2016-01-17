From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jan 2016 22:55:25 +0100
Subject: [Buildroot] [git commit] configs/sheevaplug: bump kernel to 4.4
Message-ID: <20160117220214.55E10821B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8aef3a4106608fac04608eebe9cdae10e1432bca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sheevaplug_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 9e272ff..bb53789 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -12,8 +12,8 @@ BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="4.4"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -26,7 +26,7 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
