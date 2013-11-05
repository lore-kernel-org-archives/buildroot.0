From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Nov 2013 09:03:27 -0300
Subject: [Buildroot] [PATCH 1/4] configs/qemu: bump relevant config versions
Message-ID: <1383653010-10297-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-nuri/readme.txt                                    | 2 +-
 board/qemu/arm-versatile/{linux-3.11.config => linux-3.12.config} | 0
 board/qemu/arm-versatile/readme.txt                               | 2 +-
 board/qemu/arm-vexpress/readme.txt                                | 2 +-
 .../microblazebe-mmu/{linux-3.11.config => linux-3.12.config}     | 0
 board/qemu/microblazebe-mmu/readme.txt                            | 2 +-
 .../microblazeel-mmu/{linux-3.11.config => linux-3.12.config}     | 0
 board/qemu/microblazeel-mmu/readme.txt                            | 2 +-
 board/qemu/mips-malta/{linux-3.11.config => linux-3.12.config}    | 0
 board/qemu/mips-malta/readme.txt                                  | 2 +-
 board/qemu/mips64-malta/{linux-3.11.config => linux-3.12.config}  | 0
 board/qemu/mips64-malta/readme.txt                                | 2 +-
 board/qemu/mipsel-malta/{linux-3.11.config => linux-3.12.config}  | 0
 board/qemu/mipsel-malta/readme.txt                                | 2 +-
 .../qemu/powerpc-g3beige/{linux-3.11.config => linux-3.12.config} | 0
 board/qemu/powerpc-g3beige/readme.txt                             | 2 +-
 board/qemu/powerpc-mpc8544ds/readme.txt                           | 2 +-
 board/qemu/powerpc-virtex-ml507/readme.txt                        | 2 +-
 board/qemu/sh4-r2d/readme.txt                                     | 2 +-
 board/qemu/sparc-ss10/readme.txt                                  | 2 +-
 board/qemu/x86/{linux-3.11.config => linux-3.12.config}           | 0
 board/qemu/x86/readme.txt                                         | 2 +-
 board/qemu/x86_64/{linux-3.11.config => linux-3.12.config}        | 0
 board/qemu/x86_64/readme.txt                                      | 2 +-
 configs/qemu_arm_nuri_defconfig                                   | 4 ++--
 configs/qemu_arm_versatile_defconfig                              | 8 ++++----
 configs/qemu_arm_vexpress_defconfig                               | 6 +++---
 configs/qemu_microblazebe_mmu_defconfig                           | 4 ++--
 configs/qemu_microblazeel_mmu_defconfig                           | 4 ++--
 configs/qemu_mips64_malta_defconfig                               | 8 ++++----
 configs/qemu_mips_malta_defconfig                                 | 8 ++++----
 configs/qemu_mipsel_malta_defconfig                               | 8 ++++----
 configs/qemu_ppc_g3beige_defconfig                                | 8 ++++----
 configs/qemu_ppc_mpc8544ds_defconfig                              | 6 +++---
 configs/qemu_ppc_virtex_ml507_defconfig                           | 6 +++---
 configs/qemu_sh4_r2d_defconfig                                    | 4 ++--
 configs/qemu_sparc_ss10_defconfig                                 | 6 +++---
 configs/qemu_x86_64_defconfig                                     | 8 ++++----
 configs/qemu_x86_defconfig                                        | 8 ++++----
 39 files changed, 63 insertions(+), 63 deletions(-)
 rename board/qemu/arm-versatile/{linux-3.11.config => linux-3.12.config} (100%)
 rename board/qemu/microblazebe-mmu/{linux-3.11.config => linux-3.12.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-3.11.config => linux-3.12.config} (100%)
 rename board/qemu/mips-malta/{linux-3.11.config => linux-3.12.config} (100%)
 rename board/qemu/mips64-malta/{linux-3.11.config => linux-3.12.config} (100%)
 rename board/qemu/mipsel-malta/{linux-3.11.config => linux-3.12.config} (100%)
 rename board/qemu/powerpc-g3beige/{linux-3.11.config => linux-3.12.config} (100%)
 rename board/qemu/x86/{linux-3.11.config => linux-3.12.config} (100%)
 rename board/qemu/x86_64/{linux-3.11.config => linux-3.12.config} (100%)

diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
index 0fed2f7..6fdba81 100644
--- a/board/qemu/arm-nuri/readme.txt
+++ b/board/qemu/arm-nuri/readme.txt
@@ -7,4 +7,4 @@ graphical window is the framebuffer.
 
 Startup time is slow because of the SMP CPU emulation so be patient.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/arm-versatile/linux-3.11.config b/board/qemu/arm-versatile/linux-3.12.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.11.config
rename to board/qemu/arm-versatile/linux-3.12.config
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 4902c54..7d0745f 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index 65d1996..9a4694d 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/microblazebe-mmu/linux-3.11.config b/board/qemu/microblazebe-mmu/linux-3.12.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-3.11.config
rename to board/qemu/microblazebe-mmu/linux-3.12.config
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 473a934..8ade434 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/microblazeel-mmu/linux-3.11.config b/board/qemu/microblazeel-mmu/linux-3.12.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-3.11.config
rename to board/qemu/microblazeel-mmu/linux-3.12.config
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index baddc7a..9ac55db 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/mips-malta/linux-3.11.config b/board/qemu/mips-malta/linux-3.12.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.11.config
rename to board/qemu/mips-malta/linux-3.12.config
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index 33764ea..b367927 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/mips64-malta/linux-3.11.config b/board/qemu/mips64-malta/linux-3.12.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-3.11.config
rename to board/qemu/mips64-malta/linux-3.12.config
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 23b85ab..4fa8a19 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -8,4 +8,4 @@ enabled.
 
 This configuration is known to be flaky.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/mipsel-malta/linux-3.11.config b/board/qemu/mipsel-malta/linux-3.12.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.11.config
rename to board/qemu/mipsel-malta/linux-3.12.config
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index 1e17828..b77cc84 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/powerpc-g3beige/linux-3.11.config b/board/qemu/powerpc-g3beige/linux-3.12.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-3.11.config
rename to board/qemu/powerpc-g3beige/linux-3.12.config
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index 4c0bf8a..07cb660 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/powerpc-mpc8544ds/readme.txt b/board/qemu/powerpc-mpc8544ds/readme.txt
index 8c57ead..cd56ddd 100644
--- a/board/qemu/powerpc-mpc8544ds/readme.txt
+++ b/board/qemu/powerpc-mpc8544ds/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/powerpc-virtex-ml507/readme.txt b/board/qemu/powerpc-virtex-ml507/readme.txt
index e958d49..a9a6378 100644
--- a/board/qemu/powerpc-virtex-ml507/readme.txt
+++ b/board/qemu/powerpc-virtex-ml507/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 45fca86..2a963eb 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index dab4028..725ab30 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/x86/linux-3.11.config b/board/qemu/x86/linux-3.12.config
similarity index 100%
rename from board/qemu/x86/linux-3.11.config
rename to board/qemu/x86/linux-3.12.config
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 5f3af40..c07000c 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/board/qemu/x86_64/linux-3.11.config b/board/qemu/x86_64/linux-3.12.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.11.config
rename to board/qemu/x86_64/linux-3.12.config
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index d9eaf56..3c344f9 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.6.0
+Tested with QEMU 1.6.1
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 20b825a..965f55d 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -15,11 +15,11 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.10 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.15"
+BR2_DEFAULT_KERNEL_VERSION="3.10.18"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.18"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 322fc18..88df6c8 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.12.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 8bd12af..324a811 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index adc7074..0a621b1 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.12.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 7920505..51d58c6 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.12.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazeel-mmu/system.dts"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 0fde6c6..c0904b5 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -10,16 +10,16 @@ BR2_PREFER_STATIC_LIB=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 6b952de..6e2c601 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,16 +6,16 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 0b9137a..ff640a1 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,16 +6,16 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 513c49e..bd0bc03 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,16 +6,16 @@ BR2_powerpc_750=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.12.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 5396cfa..687b537 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,14 +6,14 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 62dd741..a0dc674 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,9 +6,9 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -16,7 +16,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 99743a1..f7671d1 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.2.51"
+BR2_DEFAULT_KERNEL_VERSION="3.2.52"
 
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
@@ -21,7 +21,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.51"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.52"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 37c40c4..67bffbd 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -6,13 +6,13 @@ BR2_sparc_v8=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 520fcf1..816cef1 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.12.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 7609cde..ccccfa2 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.12.config"
-- 
1.8.1.5
