From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:51:41 +0100
Subject: [Buildroot] [git commit] configs/bananapro: bump Linux to 4.10.4
Message-ID: <20170320205452.840028018D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a3dd8084d616ea0124f46a6b3b736c8f4eab1b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/bananapro_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index fdd3ca0..a5205e0 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -4,8 +4,8 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
 
 # Toolchain
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
@@ -25,7 +25,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lemaker/bananapro/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.4"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragment"
