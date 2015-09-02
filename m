From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Sep 2015 07:43:40 -0300
Subject: [Buildroot] [PATCH] configs/qemu: update to the latest and greatest
	versions
Message-ID: <1441190620-11924-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/aarch64-virt/{linux-4.1.config => linux-4.2.config} |  0
 .../qemu/arm-versatile/{linux-4.1.config => linux-4.2.config}  |  0
 .../microblazebe-mmu/{linux-4.1.config => linux-4.2.config}    |  0
 .../microblazeel-mmu/{linux-4.1.config => linux-4.2.config}    |  0
 board/qemu/mips-malta/{linux-4.1.config => linux-4.2.config}   |  0
 board/qemu/mips64-malta/{linux-4.1.config => linux-4.2.config} |  0
 .../qemu/mips64el-malta/{linux-4.1.config => linux-4.2.config} |  0
 board/qemu/mipsel-malta/{linux-4.1.config => linux-4.2.config} |  0
 board/qemu/ppc-g3beige/{linux-4.1.config => linux-4.2.config}  |  0
 .../ppc-virtex-ml507/{linux-4.1.config => linux-4.2.config}    |  0
 board/qemu/sh4-r2d/{linux-4.1.config => linux-4.2.config}      |  0
 board/qemu/sparc-ss10/{linux-4.1.config => linux-4.2.config}   |  0
 board/qemu/{x86_64/linux-4.1.config => x86/linux-4.2.config}   |  0
 board/qemu/{x86/linux-4.1.config => x86_64/linux-4.2.config}   |  0
 board/qemu/xtensa-lx60/{linux-4.1.config => linux-4.2.config}  |  0
 configs/qemu_aarch64_virt_defconfig                            | 10 +++++-----
 configs/qemu_arm_nuri_defconfig                                |  4 ++--
 configs/qemu_arm_versatile_defconfig                           | 10 +++++-----
 configs/qemu_arm_vexpress_defconfig                            |  8 ++++----
 configs/qemu_microblazebe_mmu_defconfig                        | 10 +++++-----
 configs/qemu_microblazeel_mmu_defconfig                        | 10 +++++-----
 configs/qemu_mips64_malta_defconfig                            | 10 +++++-----
 configs/qemu_mips64el_malta_defconfig                          | 10 +++++-----
 configs/qemu_mips_malta_defconfig                              | 10 +++++-----
 configs/qemu_mipsel_malta_defconfig                            | 10 +++++-----
 configs/qemu_ppc64_pseries_defconfig                           |  8 ++++----
 configs/qemu_ppc_g3beige_defconfig                             | 10 +++++-----
 configs/qemu_ppc_mpc8544ds_defconfig                           |  8 ++++----
 configs/qemu_ppc_virtex_ml507_defconfig                        | 10 +++++-----
 configs/qemu_sh4_r2d_defconfig                                 | 10 +++++-----
 configs/qemu_sparc_ss10_defconfig                              | 10 +++++-----
 configs/qemu_x86_64_defconfig                                  | 10 +++++-----
 configs/qemu_x86_defconfig                                     | 10 +++++-----
 configs/qemu_xtensa_lx60_defconfig                             | 10 +++++-----
 34 files changed, 89 insertions(+), 89 deletions(-)
 rename board/qemu/aarch64-virt/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/arm-versatile/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/microblazebe-mmu/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/mips-malta/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/mips64-malta/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/mips64el-malta/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/mipsel-malta/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/ppc-g3beige/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/ppc-virtex-ml507/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/sh4-r2d/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/sparc-ss10/{linux-4.1.config => linux-4.2.config} (100%)
 rename board/qemu/{x86_64/linux-4.1.config => x86/linux-4.2.config} (100%)
 rename board/qemu/{x86/linux-4.1.config => x86_64/linux-4.2.config} (100%)
 rename board/qemu/xtensa-lx60/{linux-4.1.config => linux-4.2.config} (100%)

diff --git a/board/qemu/aarch64-virt/linux-4.1.config b/board/qemu/aarch64-virt/linux-4.2.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.1.config
rename to board/qemu/aarch64-virt/linux-4.2.config
diff --git a/board/qemu/arm-versatile/linux-4.1.config b/board/qemu/arm-versatile/linux-4.2.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-4.1.config
rename to board/qemu/arm-versatile/linux-4.2.config
diff --git a/board/qemu/microblazebe-mmu/linux-4.1.config b/board/qemu/microblazebe-mmu/linux-4.2.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-4.1.config
rename to board/qemu/microblazebe-mmu/linux-4.2.config
diff --git a/board/qemu/microblazeel-mmu/linux-4.1.config b/board/qemu/microblazeel-mmu/linux-4.2.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-4.1.config
rename to board/qemu/microblazeel-mmu/linux-4.2.config
diff --git a/board/qemu/mips-malta/linux-4.1.config b/board/qemu/mips-malta/linux-4.2.config
similarity index 100%
rename from board/qemu/mips-malta/linux-4.1.config
rename to board/qemu/mips-malta/linux-4.2.config
diff --git a/board/qemu/mips64-malta/linux-4.1.config b/board/qemu/mips64-malta/linux-4.2.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-4.1.config
rename to board/qemu/mips64-malta/linux-4.2.config
diff --git a/board/qemu/mips64el-malta/linux-4.1.config b/board/qemu/mips64el-malta/linux-4.2.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-4.1.config
rename to board/qemu/mips64el-malta/linux-4.2.config
diff --git a/board/qemu/mipsel-malta/linux-4.1.config b/board/qemu/mipsel-malta/linux-4.2.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-4.1.config
rename to board/qemu/mipsel-malta/linux-4.2.config
diff --git a/board/qemu/ppc-g3beige/linux-4.1.config b/board/qemu/ppc-g3beige/linux-4.2.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-4.1.config
rename to board/qemu/ppc-g3beige/linux-4.2.config
diff --git a/board/qemu/ppc-virtex-ml507/linux-4.1.config b/board/qemu/ppc-virtex-ml507/linux-4.2.config
similarity index 100%
rename from board/qemu/ppc-virtex-ml507/linux-4.1.config
rename to board/qemu/ppc-virtex-ml507/linux-4.2.config
diff --git a/board/qemu/sh4-r2d/linux-4.1.config b/board/qemu/sh4-r2d/linux-4.2.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.1.config
rename to board/qemu/sh4-r2d/linux-4.2.config
diff --git a/board/qemu/sparc-ss10/linux-4.1.config b/board/qemu/sparc-ss10/linux-4.2.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-4.1.config
rename to board/qemu/sparc-ss10/linux-4.2.config
diff --git a/board/qemu/x86_64/linux-4.1.config b/board/qemu/x86/linux-4.2.config
similarity index 100%
rename from board/qemu/x86_64/linux-4.1.config
rename to board/qemu/x86/linux-4.2.config
diff --git a/board/qemu/x86/linux-4.1.config b/board/qemu/x86_64/linux-4.2.config
similarity index 100%
rename from board/qemu/x86/linux-4.1.config
rename to board/qemu/x86_64/linux-4.2.config
diff --git a/board/qemu/xtensa-lx60/linux-4.1.config b/board/qemu/xtensa-lx60/linux-4.2.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-4.1.config
rename to board/qemu/xtensa-lx60/linux-4.2.config
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 9ae5050..f655afd 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -8,16 +8,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.2.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 56090d4..dad8638 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -16,12 +16,12 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Lock to 3.10 headers to avoid breaking with newer kernels
 # Stuck at 3.10.x because there's no Nuri DTS
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.80"
+BR2_DEFAULT_KERNEL_VERSION="3.10.87"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.80"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.87"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index ae088c2..9a69c49 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 42a506d..135812a 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,15 +13,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 190d65e..f623f6c 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.2.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 0662841..151e2f1 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.2.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index cc37fe3..2a2e576 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -6,17 +6,17 @@ BR2_MIPS_NABI64=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 6f7bcaf..d5f9cc9 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -6,17 +6,17 @@ BR2_MIPS_NABI64=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 53245b1..ffd2cbc 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index d9053a1..fb6af73 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 801d6d1..b337b48 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 060435c..538decb 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,17 +6,17 @@ BR2_powerpc_750=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 0583075..d6b8786 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,15 +6,15 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 0b3332e..d82c2dd 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,10 +6,10 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -17,9 +17,9 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index c2b88e0..951a9a7 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 05fdb3e..aa063ca 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -8,15 +8,15 @@ BR2_GLOBAL_PATCH_DIR="board/qemu/sparc-ss10"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index d5162ea..cf877ae 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,14 +9,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.2.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index a15eff3..4491672 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.2.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index b83d7e4..5c803da 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -14,17 +14,17 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.1 headers to avoid breaking with newer kernels
+# Lock to 4.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.2.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
-- 
2.4.6
