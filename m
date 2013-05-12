From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 21:44:08 +0200
Subject: [Buildroot] [git commit] configs/qemu: bump relevant config versions
Message-ID: <20130512194521.55C7F9A15E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40ccd2122e003d0c513c65eb389fe5a902ae9108
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_arm_nuri_defconfig         |    2 +-
 configs/qemu_arm_versatile_defconfig    |    2 +-
 configs/qemu_arm_vexpress_defconfig     |    2 +-
 configs/qemu_microblazebe_mmu_defconfig |    2 +-
 configs/qemu_microblazeel_mmu_defconfig |    2 +-
 configs/qemu_mips64_malta_defconfig     |    2 +-
 configs/qemu_mips_malta_defconfig       |    2 +-
 configs/qemu_mipsel_malta_defconfig     |    2 +-
 configs/qemu_ppc_g3beige_defconfig      |    2 +-
 configs/qemu_ppc_mpc8544ds_defconfig    |    2 +-
 configs/qemu_ppc_virtex_ml507_defconfig |    2 +-
 configs/qemu_x86_64_defconfig           |    2 +-
 configs/qemu_x86_defconfig              |    2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index c7e0eed..27dac27 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -20,6 +20,6 @@ BR2_KERNEL_HEADERS_3_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 1c79daa..d0f59a2 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -16,7 +16,7 @@ BR2_KERNEL_HEADERS_3_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.9.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 0e2c176..07b629e 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -20,6 +20,6 @@ BR2_KERNEL_HEADERS_3_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index f91e2f7..6bc4d0b 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.9.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index ed9c876..e82b302 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.9.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 554f0b4..72c36cc 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -16,7 +16,7 @@ BR2_KERNEL_HEADERS_3_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 4dc3683..245e36f 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -12,7 +12,7 @@ BR2_KERNEL_HEADERS_3_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index eae86ab..80d1ecb 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -12,7 +12,7 @@ BR2_KERNEL_HEADERS_3_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 884291d..4184bea 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -12,7 +12,7 @@ BR2_KERNEL_HEADERS_3_8=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.13"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index fdf6fb6..bbb246b 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -12,7 +12,7 @@ BR2_KERNEL_HEADERS_3_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 5280cbb..8bd067e 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -15,7 +15,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 7032221..1768eee 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -15,6 +15,6 @@ BR2_KERNEL_HEADERS_3_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.9.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 919d875..244bd8a 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -16,6 +16,6 @@ BR2_KERNEL_HEADERS_3_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.9.config"
