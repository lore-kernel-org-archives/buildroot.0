From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat,  4 Jan 2020 17:48:38 +0100
Subject: [Buildroot] [PATCH 2/2] configs/bananapro: bump Linux to 5.4.7
In-Reply-To: <20200104164838.1501828-1-b.bilas@grinn-global.com>
References: <20200104164838.1501828-1-b.bilas@grinn-global.com>
Message-ID: <20200104164838.1501828-2-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 configs/bananapro_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index 95bd871468..e87d9ba633 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -5,8 +5,8 @@ BR2_GLOBAL_PATCH_DIR="board/lemaker/bananapro/patches"
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # Toolchain
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lemaker/bananapro/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.7"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragment"
-- 
2.24.1
