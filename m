From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 09:17:37 +0200
Subject: [Buildroot] [git commit] configs: friendlyarm_nanopi_neo2: Bump to
 the linux kernel 5.0
Message-ID: <20190407071706.6CD9D81E03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a17748184b7aabdee87a500cf9f6d1f381768f55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps to linux/linux-headers 5.0

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/friendlyarm_nanopi_neo2_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
index f133e8091e..f247d76473 100644
--- a/configs/friendlyarm_nanopi_neo2_defconfig
+++ b/configs/friendlyarm_nanopi_neo2_defconfig
@@ -2,8 +2,8 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo2/boot.cmd"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo2"
