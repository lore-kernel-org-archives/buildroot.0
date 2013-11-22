From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 12:03:19 +0100
Subject: [Buildroot] [git commit] configs/qemu: bump relevant config versions
Message-ID: <20131122145920.CAC559B7A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3ab5bfafe02397c6415623f2c42412b540fb371
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
 configs/qemu_mips_malta_defconfig       |    4 ++--
 configs/qemu_mipsel_malta_defconfig     |    4 ++--
 configs/qemu_ppc_g3beige_defconfig      |    4 ++--
 configs/qemu_ppc_mpc8544ds_defconfig    |    4 ++--
 configs/qemu_ppc_virtex_ml507_defconfig |    4 ++--
 configs/qemu_sparc_ss10_defconfig       |    4 ++--
 configs/qemu_x86_64_defconfig           |    4 ++--
 configs/qemu_x86_defconfig              |    4 ++--
 14 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index af3e79a..f6fc12e 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -15,11 +15,11 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.10 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.19"
+BR2_DEFAULT_KERNEL_VERSION="3.10.20"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.20"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 1c66696..c65b9c1 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.8"
+BR2_DEFAULT_KERNEL_VERSION="3.11.9"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.11.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 324a811..6b393ef 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -15,11 +15,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 0a621b1..ea75624 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.12.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 51d58c6..82c56c0 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.12.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index c0904b5..e1295dd 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 6e2c601..8a6ed26 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index ff640a1..9a4164d 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index bd0bc03..f284b9b 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 687b537..bf94c9f 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index a0dc674..2d57338 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -16,7 +16,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 67bffbd..0f11fa3 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -8,11 +8,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 816cef1..0e33da3 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -11,11 +11,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.12.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index ccccfa2..05404ba 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -12,11 +12,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.12.1"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.12.config"
