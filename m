From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 24 Aug 2018 15:45:00 +0200
Subject: [Buildroot] [PATCH v4 4/4] configs: add linux boot logo to a
 selection of configs
In-Reply-To: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
References: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1535118300-26815-4-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch adds the buildroot logo as a boot log to a selection of
defconfigs.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 configs/pc_x86_64_bios_defconfig           | 1 +
 configs/pc_x86_64_efi_defconfig            | 1 +
 configs/qemu_aarch64_virt_defconfig        | 1 +
 configs/qemu_arm_versatile_defconfig       | 2 ++
 configs/qemu_arm_versatile_nommu_defconfig | 1 +
 configs/qemu_arm_vexpress_defconfig        | 1 +
 configs/qemu_m68k_mcf5208_defconfig        | 1 +
 configs/qemu_m68k_q800_defconfig           | 1 +
 configs/qemu_microblazebe_mmu_defconfig    | 1 +
 configs/qemu_microblazeel_mmu_defconfig    | 1 +
 configs/qemu_mips32r2_malta_defconfig      | 1 +
 configs/qemu_mips32r2el_malta_defconfig    | 1 +
 configs/qemu_mips32r6_malta_defconfig      | 1 +
 configs/qemu_mips32r6el_malta_defconfig    | 1 +
 configs/qemu_mips64_malta_defconfig        | 1 +
 configs/qemu_mips64el_malta_defconfig      | 1 +
 configs/qemu_mips64r6_malta_defconfig      | 1 +
 configs/qemu_mips64r6el_malta_defconfig    | 1 +
 configs/qemu_nios2_10m50_defconfig         | 1 +
 configs/qemu_or1k_defconfig                | 1 +
 configs/qemu_ppc64_e5500_defconfig         | 1 +
 configs/qemu_ppc64_pseries_defconfig       | 1 +
 configs/qemu_ppc64le_pseries_defconfig     | 1 +
 configs/qemu_ppc_g3beige_defconfig         | 1 +
 configs/qemu_ppc_mpc8544ds_defconfig       | 1 +
 configs/qemu_ppc_virtex_ml507_defconfig    | 1 +
 configs/qemu_sh4_r2d_defconfig             | 1 +
 configs/qemu_sh4eb_r2d_defconfig           | 1 +
 configs/qemu_sparc64_sun4u_defconfig       | 1 +
 configs/qemu_sparc_ss10_defconfig          | 1 +
 configs/qemu_x86_64_defconfig              | 1 +
 configs/qemu_x86_defconfig                 | 1 +
 configs/qemu_xtensa_lx60_defconfig         | 1 +
 configs/qemu_xtensa_lx60_nommu_defconfig   | 1 +
 configs/raspberrypi3_defconfig             | 1 +
 35 files changed, 36 insertions(+)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 47787bc..65e9430 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -32,6 +32,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 67ba5bc..af036d2 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -35,6 +35,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 2706544..71e2f1b 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -20,3 +20,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 348b91b..7069e20 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -21,3 +21,5 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
+
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 910c382..7c5de6a 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -32,3 +32,4 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 34a50aa..377db46 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -23,3 +23,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index 8f8d0a0..449bd8e 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index d9238b6..36cc33f 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 3055a0f..b65cd26 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -21,3 +21,4 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 073a717..74a1bc5 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -21,3 +21,4 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index d07bc11..70b5e6c 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 55e68b1..733756a 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 5802393..d286630 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Compiler
 # linux >= 4.4 uses -mcompact-branches which is only available since gcc-6
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index 93e2a86..adad82e 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Compiler
 # linux >= 4.4 uses -mcompact-branches which is only available since GCC 6.x
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 99b457a..75c8eae 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index f2dacbd..25642f6 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index d291213..8cce6aa 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -20,6 +20,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Compiler
 # linux >= 4.4 uses -mcompact-branches which is only available since gcc-6
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 4740bde..a998d65 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -20,6 +20,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Compiler
 # linux >= 4.4 uses -mcompact-branches which is only available since gcc-6
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index cff2192..4cc4e75 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -4,6 +4,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="10m50"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Linux headers same as kernel, a 4.16 series
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 636a0d2..1952866 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -14,3 +14,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 7a325a5..7af6d6f 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index d2d69f1..7979099 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 9a85f76..dc283e4 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 451a9b5..45823cc 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 38e41a7..0b95db5 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 6824afc..997caf9 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -21,3 +21,4 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index ec4a91c..67f8771 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -21,3 +21,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index e7dbd46..b0fe41e 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -20,3 +20,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index baa8dbf..837ce00 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -18,3 +18,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 9943781..326a881 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -18,3 +18,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 12b30bf..1103f42 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -18,3 +18,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 985ff32..04598d7 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index a735c99..239c4bd 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -23,3 +23,4 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index f4d6837..d8053eb 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -27,3 +27,4 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 0ef9afe..97d8b25 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -13,6 +13,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,865ddc1393f558198e7e7ce70928ff2e49c4f7f6)/linux-865ddc1393f558198e7e7ce70928ff2e49c4f7f6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
