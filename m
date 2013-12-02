From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2013 08:42:24 +0100
Subject: [Buildroot] [git commit] configs/qemu: bump relevant config versions
Message-ID: <20131202102417.067249BDF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b9c124a7bde91f9f79359721f5f3c96cc01aa3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_arm_nuri_defconfig         |    4 ++--
 configs/qemu_arm_versatile_defconfig    |    4 ++--
 configs/qemu_arm_vexpress_defconfig     |    4 ++--
 configs/qemu_microblazebe_mmu_defconfig |    2 +-
 configs/qemu_microblazeel_mmu_defconfig |    2 +-
 configs/qemu_mips64_malta_defconfig     |    4 ++--
 configs/qemu_mips64el_malta_defconfig   |    4 ++--
 configs/qemu_mips_malta_defconfig       |    4 ++--
 configs/qemu_mipsel_malta_defconfig     |    4 ++--
 configs/qemu_ppc_g3beige_defconfig      |    4 ++--
 configs/qemu_ppc_mpc8544ds_defconfig    |    4 ++--
 configs/qemu_ppc_virtex_ml507_defconfig |    4 ++--
 configs/qemu_sh4_r2d_defconfig          |    4 ++--
 configs/qemu_sparc_ss10_defconfig       |    4 ++--
 configs/qemu_x86_64_defconfig           |    4 ++--
 configs/qemu_x86_defconfig              |    4 ++--
 16 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index f6fc12e..8cb1153 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -15,11 +15,11 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.10 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.20"
+BR2_DEFAULT_KERNEL_VERSION="3.10.21"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.20"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.21"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index c65b9c1..a26054d 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.9"
+BR2_DEFAULT_KERNEL_VERSION="3.11.10"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.11.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 6b393ef..4a4db1b 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -15,11 +15,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index ea75624..c090143 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.12.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 82c56c0..7538d3f 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.12.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index c40abc1..2461325 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 73fb22f..0d780f4 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -11,12 +11,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 8a6ed26..bc1edd6 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 9a4164d..c654351 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index f284b9b..a6ced5e 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index bf94c9f..745a3ca 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 2d57338..f79feb5 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -16,7 +16,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index f7671d1..bcd50dd 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.2.52"
+BR2_DEFAULT_KERNEL_VERSION="3.2.53"
 
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
@@ -21,7 +21,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.52"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.53"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 0f11fa3..82f5485 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -8,11 +8,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 0e33da3..811f968 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -11,11 +11,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.12.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 05404ba..d642c45 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -12,11 +12,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.1"
+BR2_DEFAULT_KERNEL_VERSION="3.12.2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.12.config"
