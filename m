From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Feb 2013 15:49:39 -0300
Subject: [Buildroot] [PATCH] configs/qemu: update to use latest kernels
Message-ID: <1360176579-26502-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_arm_nuri_defconfig         | 2 +-
 configs/qemu_arm_versatile_defconfig    | 2 +-
 configs/qemu_arm_vexpress_defconfig     | 2 +-
 configs/qemu_microblazebe_mmu_defconfig | 2 +-
 configs/qemu_microblazeel_mmu_defconfig | 2 +-
 configs/qemu_mips64_malta_defconfig     | 2 +-
 configs/qemu_mips_malta_defconfig       | 2 +-
 configs/qemu_mipsel_malta_defconfig     | 2 +-
 configs/qemu_ppc_g3beige_defconfig      | 2 +-
 configs/qemu_ppc_mpc8544ds_defconfig    | 2 +-
 configs/qemu_ppc_virtex_ml507_defconfig | 2 +-
 configs/qemu_sh4_r2d_defconfig          | 2 +-
 configs/qemu_sparc_ss10_defconfig       | 2 +-
 configs/qemu_x86_64_defconfig           | 2 +-
 configs/qemu_x86_defconfig              | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 0ae0de6..4bc7bb2 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -20,6 +20,6 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 428e07e..cbd7dd1 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -16,7 +16,7 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.7.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index f749800..8ff5a46 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -20,6 +20,6 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 6f5c871..4643017 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.7.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 6f9f8f9..6ecbd4c 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.7.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 8644acd..b8ca948 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -16,7 +16,7 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.7.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 33c389a..6b034f6 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -12,7 +12,7 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.7.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 3adde2f..adaaedd 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -12,7 +12,7 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.7.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 5aef9bf..080ee4d 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -12,7 +12,7 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.7.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 39f0339..68211a0 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -12,7 +12,7 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 59812c9..9dfbe52 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -15,7 +15,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index e7dba9b..4dfccd9 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -20,7 +20,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.38"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 0b65866..906671b 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -12,6 +12,6 @@ BR2_KERNEL_HEADERS_3_7=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 2093242..74011fc 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -15,6 +15,6 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.7.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index ddb9fd1..2734fdb 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -16,6 +16,6 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.7.config"
-- 
1.7.12.4
