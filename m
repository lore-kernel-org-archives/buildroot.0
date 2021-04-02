From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  3 Apr 2021 00:20:38 +0200
Subject: [Buildroot] [PATCH 2/3] configs/amarula_vyasa_rk3288: vyasa: bump
 Linux version to 5.11
In-Reply-To: <20210402222039.3812925-1-giulio.benetti@benettiengineering.com>
References: <20210402222039.3812925-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210402222039.3812925-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump Linux and headers version to 5.11

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 3403589253..3b12da077c 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 5.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
@@ -22,7 +22,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
-- 
2.25.1
