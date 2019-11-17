From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:19:07 +0100
Subject: [Buildroot] [PATCH v3 for-next 09/11] configs/qemu-*: add a comment
 to provide the path launch.sh script for each Qemu defconfig
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <20191117201909.12900-10-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This comment could be useful to point peoples at the script to
start Qemu but also for a script used in a automated CI (gitlab).

The path provided in the defconfig allow to "link" explicitely
a Qemu defconfig and it's Qemu command line.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 configs/qemu_aarch64_virt_defconfig        | 2 ++
 configs/qemu_arm_versatile_defconfig       | 2 ++
 configs/qemu_arm_versatile_nommu_defconfig | 2 ++
 configs/qemu_arm_vexpress_defconfig        | 2 ++
 configs/qemu_arm_vexpress_tz_defconfig     | 2 ++
 configs/qemu_csky610_virt_defconfig        | 2 ++
 configs/qemu_csky807_virt_defconfig        | 2 ++
 configs/qemu_csky810_virt_defconfig        | 2 ++
 configs/qemu_csky860_virt_defconfig        | 2 ++
 configs/qemu_m68k_mcf5208_defconfig        | 2 ++
 configs/qemu_m68k_q800_defconfig           | 2 ++
 configs/qemu_microblazebe_mmu_defconfig    | 2 ++
 configs/qemu_microblazeel_mmu_defconfig    | 2 ++
 configs/qemu_mips32r2_malta_defconfig      | 2 ++
 configs/qemu_mips32r2el_malta_defconfig    | 2 ++
 configs/qemu_mips32r6_malta_defconfig      | 2 ++
 configs/qemu_mips32r6el_malta_defconfig    | 2 ++
 configs/qemu_mips64_malta_defconfig        | 2 ++
 configs/qemu_mips64el_malta_defconfig      | 2 ++
 configs/qemu_mips64r6_malta_defconfig      | 2 ++
 configs/qemu_mips64r6el_malta_defconfig    | 2 ++
 configs/qemu_nios2_10m50_defconfig         | 2 ++
 configs/qemu_or1k_defconfig                | 2 ++
 configs/qemu_ppc64_e5500_defconfig         | 2 ++
 configs/qemu_ppc64_pseries_defconfig       | 2 ++
 configs/qemu_ppc64le_pseries_defconfig     | 2 ++
 configs/qemu_ppc_g3beige_defconfig         | 2 ++
 configs/qemu_ppc_mac99_defconfig           | 2 ++
 configs/qemu_ppc_mpc8544ds_defconfig       | 2 ++
 configs/qemu_ppc_virtex_ml507_defconfig    | 2 ++
 configs/qemu_riscv32_virt_defconfig        | 2 ++
 configs/qemu_riscv64_virt_defconfig        | 2 ++
 configs/qemu_sh4_r2d_defconfig             | 2 ++
 configs/qemu_sh4eb_r2d_defconfig           | 2 ++
 configs/qemu_sparc64_sun4u_defconfig       | 2 ++
 configs/qemu_sparc_ss10_defconfig          | 2 ++
 configs/qemu_x86_64_defconfig              | 2 ++
 configs/qemu_x86_defconfig                 | 2 ++
 configs/qemu_xtensa_lx60_defconfig         | 2 ++
 configs/qemu_xtensa_lx60_nommu_defconfig   | 2 ++
 40 files changed, 80 insertions(+)

diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 212d779ac9..c0ca6c9840 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/aarch64-virt/launch.sh
+
 # Architecture
 BR2_aarch64=y
 BR2_cortex_a53=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 1194644eca..ef85cef4ba 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/arm-versatile/launch.sh
+
 # Architecture
 BR2_arm=y
 BR2_arm926t=y
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index c4fefeef48..10265b77da 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/arm-versatile-nommu/launch.sh
+
 # Architecture
 BR2_arm=y
 BR2_arm926t=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index e52a14081e..191610e924 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/arm-vexpress/launch.sh
+
 # Architecture
 BR2_arm=y
 BR2_cortex_a9=y
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index bf75493dbe..c5c5467b3d 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/arm-vexpress-tz/launch.sh
+
 # Architecture
 BR2_arm=y
 BR2_cortex_a15=y
diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
index be5fee8c6a..4fffda51de 100644
--- a/configs/qemu_csky610_virt_defconfig
+++ b/configs/qemu_csky610_virt_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/csky610-virt/launch.sh
+
 # Architecture
 BR2_csky=y
 BR2_ck610=y
diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
index 09e0e3dd01..95e2b19e8b 100644
--- a/configs/qemu_csky807_virt_defconfig
+++ b/configs/qemu_csky807_virt_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/csky807-virt/launch.sh
+
 # Architecture
 BR2_csky=y
 BR2_ck807=y
diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
index f6d3b82206..0221bdd263 100644
--- a/configs/qemu_csky810_virt_defconfig
+++ b/configs/qemu_csky810_virt_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/csky810-virt/launch.sh
+
 # Architecture
 BR2_csky=y
 BR2_ck810=y
diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
index 896b9a8f2e..71c186e8ce 100644
--- a/configs/qemu_csky860_virt_defconfig
+++ b/configs/qemu_csky860_virt_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/csky860-virt/launch.sh
+
 # Architecture
 BR2_csky=y
 BR2_ck860=y
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index 4dde10b3aa..414f0c962e 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/m68k-mcf5208/launch.sh
+
 # Architecture
 BR2_m68k=y
 BR2_m68k_cf5208=y
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 0dd90a97b3..868e4f0980 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/m68k-q800/launch.sh
+
 # Architecture
 BR2_m68k=y
 BR2_m68k_68040=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 022d2b7825..661f30ab64 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/microblazebe-mmu/launch.sh
+
 # Architecture
 BR2_microblaze=y
 BR2_microblazebe=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index fbe02ca429..7bf5a2aaec 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/microblazeel-mmu/launch.sh
+
 # Architecture
 BR2_microblaze=y
 BR2_microblazeel=y
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index 838a3d6621..3ce6ebe0b9 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/mips32r2-malta/launch.sh
+
 # Architecture
 BR2_mips=y
 BR2_mips_32r2=y
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index aaf382143a..998b3e03f1 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/mips32r2el-malta/launch.sh
+
 # Architecture
 BR2_mipsel=y
 BR2_mips_32r2=y
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 01781f3159..2ecf92e89b 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/mips32r6-malta/launch.sh
+
 # Architecture
 BR2_mips=y
 BR2_mips_32r6=y
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index 1d3d0aff9b..958a44252a 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/mips32r6el-malta/launch.sh
+
 # Architecture
 BR2_mipsel=y
 BR2_mips_32r6=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 20e368a323..7a07408e4c 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/mips64-malta/launch.sh
+
 # Architecture
 BR2_mips64=y
 BR2_MIPS_NABI64=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 2ec28436bb..8a7c6fbcdc 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/mips64el-malta/launch.sh
+
 # Architecture
 BR2_mips64el=y
 BR2_MIPS_NABI64=y
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index 5c00cf588b..289cedf22f 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/mips64r6-malta/launch.sh
+
 # Architecture
 BR2_mips64=y
 BR2_mips_64r6=y
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 03f5651e93..5b668ff68f 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/mips64r6el-malta/launch.sh
+
 # Architecture
 BR2_mips64el=y
 BR2_mips_64r6=y
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index 24573fc083..5445146b5d 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/nios2-10m50/launch.sh
+
 BR2_nios2=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 3d3fd537a3..2f6c38b4f6 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/or1k/launch.sh
+
 # Architecture
 BR2_or1k=y
 
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index d5d66474b0..45b0cbdf15 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/ppc64-e5500/launch.sh
+
 # Architecture
 BR2_powerpc64=y
 BR2_powerpc_e5500=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 200c50da1a..ca14b62ec9 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/ppc64-pseries/launch.sh
+
 # Architecture
 BR2_powerpc64=y
 BR2_powerpc_power7=y
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 0eb3f117c1..3ee70fe869 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/ppc64le-pseries/launch.sh
+
 # Architecture
 BR2_powerpc64le=y
 BR2_powerpc_power8=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 8034abce51..be46767edb 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/ppc-g3beige/launch.sh
+
 # Architecture
 BR2_powerpc=y
 BR2_powerpc_750=y
diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
index 9a33c3d82c..66368dbed4 100644
--- a/configs/qemu_ppc_mac99_defconfig
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/ppc-mac99/launch.sh
+
 BR2_powerpc=y
 BR2_powerpc_7400=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 9a529ae54b..cf9ba12858 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/ppc-mpc8544ds/launch.sh
+
 # Architecture
 BR2_powerpc=y
 BR2_powerpc_8548=y
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 4b60675474..2df88b62e1 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/ppc-virtex-ml507/launch.sh
+
 # Architecture
 BR2_powerpc=y
 BR2_powerpc_440=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 914eada004..dece6673db 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/riscv32-virt/launch.sh
+
 # Architecture
 BR2_riscv=y
 BR2_RISCV_32=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 5c52f7a0f8..478b10d333 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/riscv64-virt/launch.sh
+
 # Architecture
 BR2_riscv=y
 BR2_RISCV_64=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index ca7b25e295..f75a9de458 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/sh4-r2d/launch.sh
+
 # Architecture
 BR2_sh=y
 BR2_sh4=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 0664a08c4d..b58c6b0b88 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/sh4eb-r2d/launch.sh
+
 # Architecture
 BR2_sh=y
 BR2_sh4eb=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 70b4f13cf8..71841a6feb 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/sparc64-sun4u/launch.sh
+
 # Architecture
 BR2_sparc64=y
 BR2_sparc_v9=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 23733d8594..ae18d2e0c7 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/sparc-ss10/launch.sh
+
 # Architecture
 BR2_sparc=y
 BR2_sparc_v8=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index f9d868d169..2752f70e97 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/x86_64/launch.sh
+
 # Architecture
 BR2_x86_64=y
 
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index cb68b5f4ff..e08a7a5c51 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/x86/launch.sh
+
 # Architecture
 BR2_i386=y
 BR2_x86_pentiumpro=y
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index a5fd14b3fd..380ebe1453 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/xtensa-lx60/launch.sh
+
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 750e37dc07..1fe82488f9 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -1,3 +1,5 @@
+# To start Qemu, use the Qemu command line from: board/qemu/xtensa-lx60/launch.sh
+
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
-- 
2.21.0
