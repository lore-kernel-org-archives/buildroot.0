From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Mar 2015 19:31:23 -0300
Subject: [Buildroot] [PATCH] configs/qemu: update to the latest
	kernel/headers versions
Message-ID: <1425335483-6982-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qemu_arm_vexpress_defconfig is broken for 3.19 so keep it with 3.18.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../qemu/aarch64-virt/{linux-3.18.config => linux-3.19.config} |  0
 .../arm-versatile/{linux-3.18.config => linux-3.19.config}     |  0
 .../microblazebe-mmu/{linux-3.18.config => linux-3.19.config}  |  0
 .../microblazeel-mmu/{linux-3.18.config => linux-3.19.config}  |  0
 board/qemu/mips-malta/{linux-3.18.config => linux-3.19.config} |  0
 .../qemu/mips64-malta/{linux-3.18.config => linux-3.19.config} |  0
 .../mips64el-malta/{linux-3.18.config => linux-3.19.config}    |  0
 .../qemu/mipsel-malta/{linux-3.18.config => linux-3.19.config} |  0
 .../qemu/ppc-g3beige/{linux-3.18.config => linux-3.19.config}  |  0
 board/qemu/sh4-r2d/{linux-3.18.config => linux-3.19.config}    |  0
 board/qemu/sparc-ss10/{linux-3.18.config => linux-3.19.config} |  0
 board/qemu/{x86_64/linux-3.18.config => x86/linux-3.19.config} |  0
 board/qemu/{x86/linux-3.18.config => x86_64/linux-3.19.config} |  0
 .../qemu/xtensa-lx60/{linux-3.18.config => linux-3.19.config}  |  0
 configs/qemu_aarch64_virt_defconfig                            | 10 +++++-----
 configs/qemu_arm_nuri_defconfig                                |  4 ++--
 configs/qemu_arm_versatile_defconfig                           | 10 +++++-----
 configs/qemu_arm_vexpress_defconfig                            |  4 ++--
 configs/qemu_microblazebe_mmu_defconfig                        | 10 +++++-----
 configs/qemu_microblazeel_mmu_defconfig                        | 10 +++++-----
 configs/qemu_mips64_malta_defconfig                            | 10 +++++-----
 configs/qemu_mips64el_malta_defconfig                          | 10 +++++-----
 configs/qemu_mips_malta_defconfig                              | 10 +++++-----
 configs/qemu_mipsel_malta_defconfig                            | 10 +++++-----
 configs/qemu_ppc64_pseries_defconfig                           |  8 ++++----
 configs/qemu_ppc_g3beige_defconfig                             | 10 +++++-----
 configs/qemu_ppc_mpc8544ds_defconfig                           |  8 ++++----
 configs/qemu_ppc_virtex_ml507_defconfig                        |  8 ++++----
 configs/qemu_sh4_r2d_defconfig                                 | 10 +++++-----
 configs/qemu_sparc_ss10_defconfig                              | 10 +++++-----
 configs/qemu_x86_64_defconfig                                  | 10 +++++-----
 configs/qemu_x86_defconfig                                     | 10 +++++-----
 configs/qemu_xtensa_lx60_defconfig                             | 10 +++++-----
 33 files changed, 86 insertions(+), 86 deletions(-)
 rename board/qemu/aarch64-virt/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/arm-versatile/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/microblazebe-mmu/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/mips-malta/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/mips64-malta/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/mips64el-malta/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/mipsel-malta/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/ppc-g3beige/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/sh4-r2d/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/sparc-ss10/{linux-3.18.config => linux-3.19.config} (100%)
 rename board/qemu/{x86_64/linux-3.18.config => x86/linux-3.19.config} (100%)
 rename board/qemu/{x86/linux-3.18.config => x86_64/linux-3.19.config} (100%)
 rename board/qemu/xtensa-lx60/{linux-3.18.config => linux-3.19.config} (100%)

diff --git a/board/qemu/aarch64-virt/linux-3.18.config b/board/qemu/aarch64-virt/linux-3.19.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-3.18.config
rename to board/qemu/aarch64-virt/linux-3.19.config
diff --git a/board/qemu/arm-versatile/linux-3.18.config b/board/qemu/arm-versatile/linux-3.19.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.18.config
rename to board/qemu/arm-versatile/linux-3.19.config
diff --git a/board/qemu/microblazebe-mmu/linux-3.18.config b/board/qemu/microblazebe-mmu/linux-3.19.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-3.18.config
rename to board/qemu/microblazebe-mmu/linux-3.19.config
diff --git a/board/qemu/microblazeel-mmu/linux-3.18.config b/board/qemu/microblazeel-mmu/linux-3.19.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-3.18.config
rename to board/qemu/microblazeel-mmu/linux-3.19.config
diff --git a/board/qemu/mips-malta/linux-3.18.config b/board/qemu/mips-malta/linux-3.19.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.18.config
rename to board/qemu/mips-malta/linux-3.19.config
diff --git a/board/qemu/mips64-malta/linux-3.18.config b/board/qemu/mips64-malta/linux-3.19.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-3.18.config
rename to board/qemu/mips64-malta/linux-3.19.config
diff --git a/board/qemu/mips64el-malta/linux-3.18.config b/board/qemu/mips64el-malta/linux-3.19.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-3.18.config
rename to board/qemu/mips64el-malta/linux-3.19.config
diff --git a/board/qemu/mipsel-malta/linux-3.18.config b/board/qemu/mipsel-malta/linux-3.19.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.18.config
rename to board/qemu/mipsel-malta/linux-3.19.config
diff --git a/board/qemu/ppc-g3beige/linux-3.18.config b/board/qemu/ppc-g3beige/linux-3.19.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-3.18.config
rename to board/qemu/ppc-g3beige/linux-3.19.config
diff --git a/board/qemu/sh4-r2d/linux-3.18.config b/board/qemu/sh4-r2d/linux-3.19.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-3.18.config
rename to board/qemu/sh4-r2d/linux-3.19.config
diff --git a/board/qemu/sparc-ss10/linux-3.18.config b/board/qemu/sparc-ss10/linux-3.19.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-3.18.config
rename to board/qemu/sparc-ss10/linux-3.19.config
diff --git a/board/qemu/x86_64/linux-3.18.config b/board/qemu/x86/linux-3.19.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.18.config
rename to board/qemu/x86/linux-3.19.config
diff --git a/board/qemu/x86/linux-3.18.config b/board/qemu/x86_64/linux-3.19.config
similarity index 100%
rename from board/qemu/x86/linux-3.18.config
rename to board/qemu/x86_64/linux-3.19.config
diff --git a/board/qemu/xtensa-lx60/linux-3.18.config b/board/qemu/xtensa-lx60/linux-3.19.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-3.18.config
rename to board/qemu/xtensa-lx60/linux-3.19.config
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 94ea2ed..c99edfa 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -8,16 +8,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-3.19.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 1b691d9..bf70df0 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -16,12 +16,12 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Lock to 3.10 headers to avoid breaking with newer kernels
 # Stuck at 3.10.x because there's no Nuri DTS
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.66"
+BR2_DEFAULT_KERNEL_VERSION="3.10.70"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.66"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.70"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index f48a64d..272e55b 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.19.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 9574d95..f23da96 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -15,12 +15,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
+BR2_DEFAULT_KERNEL_VERSION="3.18.8"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 93d43c1..8fb077b 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.19.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index dacc79c..80f8207 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.19.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 2d6202e..8bce340 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -6,17 +6,17 @@ BR2_MIPS_NABI64=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.19.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index cbdb7f8..8d3a132 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,17 +9,17 @@ BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.19.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index f018317..4ed02c0 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.19.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 71dbe23..012eefe 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.19.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index c2cf1af..d73e67f 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index a85e93e..285093c 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,17 +6,17 @@ BR2_powerpc_750=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-3.19.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 33551ab..14faac3 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,15 +6,15 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index c33aeec..a5b97db 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,10 +6,10 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -17,7 +17,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index fce1c4b..88bf914 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -14,15 +14,15 @@ BR2_TARGET_ROOTFS_EXT2=y
 # doesn't use floating point operations.
 BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.19.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 8f2702b..73195fa 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -8,15 +8,15 @@ BR2_GLOBAL_PATCH_DIR="board/qemu/sparc-ss10"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-3.19.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 4bc0b49..8cb777a 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,14 +9,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.19.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index ce89ff7..f0831b0 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.19.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 8874c7c..4eb10fb 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -14,17 +14,17 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-3.19.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
-- 
2.0.5
