From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Dec 2013 21:40:49 -0300
Subject: [Buildroot] [PATCH 2/2] configs/qemu: update for host-qemu-system
	goodness
In-Reply-To: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386117649-7119-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-nuri/readme.txt             | 2 +-
 board/qemu/arm-versatile/readme.txt        | 2 +-
 board/qemu/arm-vexpress/readme.txt         | 2 +-
 board/qemu/microblazebe-mmu/readme.txt     | 2 +-
 board/qemu/microblazeel-mmu/readme.txt     | 2 +-
 board/qemu/mips-malta/readme.txt           | 2 +-
 board/qemu/mips64-malta/readme.txt         | 2 +-
 board/qemu/mips64el-malta/readme.txt       | 2 +-
 board/qemu/mipsel-malta/readme.txt         | 2 +-
 board/qemu/powerpc-g3beige/readme.txt      | 2 +-
 board/qemu/powerpc-mpc8544ds/readme.txt    | 2 +-
 board/qemu/powerpc-virtex-ml507/readme.txt | 2 +-
 board/qemu/sh4-r2d/readme.txt              | 2 +-
 board/qemu/sparc-ss10/readme.txt           | 2 +-
 board/qemu/x86/readme.txt                  | 2 +-
 board/qemu/x86_64/readme.txt               | 2 +-
 configs/qemu_arm_nuri_defconfig            | 4 ++++
 configs/qemu_arm_versatile_defconfig       | 4 ++++
 configs/qemu_arm_vexpress_defconfig        | 4 ++++
 configs/qemu_microblazebe_mmu_defconfig    | 4 ++++
 configs/qemu_microblazeel_mmu_defconfig    | 4 ++++
 configs/qemu_mips64_malta_defconfig        | 4 ++++
 configs/qemu_mips64el_malta_defconfig      | 4 ++++
 configs/qemu_mips_malta_defconfig          | 4 ++++
 configs/qemu_mipsel_malta_defconfig        | 4 ++++
 configs/qemu_ppc_g3beige_defconfig         | 4 ++++
 configs/qemu_ppc_mpc8544ds_defconfig       | 4 ++++
 configs/qemu_ppc_virtex_ml507_defconfig    | 4 ++++
 configs/qemu_sh4_r2d_defconfig             | 4 ++++
 configs/qemu_sparc_ss10_defconfig          | 5 +++++
 configs/qemu_x86_64_defconfig              | 4 ++++
 configs/qemu_x86_defconfig                 | 4 ++++
 32 files changed, 81 insertions(+), 16 deletions(-)

diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
index 6fdba81..0cf8d0b 100644
--- a/board/qemu/arm-nuri/readme.txt
+++ b/board/qemu/arm-nuri/readme.txt
@@ -7,4 +7,4 @@ graphical window is the framebuffer.
 
 Startup time is slow because of the SMP CPU emulation so be patient.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 7d0745f..2c02e26 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index 9a4694d..50dd563 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 8ade434..3c7e10c 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 9ac55db..d402d13 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index b367927..719a624 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 7999b78..3ce3c62 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index dba33d3..48bae37 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index b77cc84..dd290c4 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index 07cb660..2711350 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/powerpc-mpc8544ds/readme.txt b/board/qemu/powerpc-mpc8544ds/readme.txt
index cd56ddd..27b3bee 100644
--- a/board/qemu/powerpc-mpc8544ds/readme.txt
+++ b/board/qemu/powerpc-mpc8544ds/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/powerpc-virtex-ml507/readme.txt b/board/qemu/powerpc-virtex-ml507/readme.txt
index a9a6378..0547987 100644
--- a/board/qemu/powerpc-virtex-ml507/readme.txt
+++ b/board/qemu/powerpc-virtex-ml507/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 2a963eb..73dce14 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 725ab30..a126a55 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user
+  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user -display none
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index c07000c..c821255 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 3c344f9..f350d36 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 8cb1153..a8bacde 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -23,3 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.21"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu-system
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M nuri -kernel output/images/zImage -append 'console=ttySAC1,115200' -smp 2 -serial null -serial stdio -display none"
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index a26054d..956ba6d 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -21,3 +21,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.11.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu-system
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi -append 'root=/dev/sda console=ttyAMA0,115200' -serial stdio -net nic,model=smc91c111 -net user -display none"
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 4a4db1b..fc0c012 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -23,3 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M vexpress-a9 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=sd -append 'console=ttyAMA0,115200 root=/dev/mmcblk0' -serial stdio -net nic,model=lan9118 -net user -display none"
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index c090143..8fb6f54 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -25,3 +25,7 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.12.conf
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio -display none"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 7538d3f..ccf776f 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -25,3 +25,7 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.12.conf
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazeel-mmu/system.dts"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio -display none"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 2461325..4e840ab 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -21,3 +21,7 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append 'root=/dev/hda' -display none"
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 0d780f4..317aec7 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -24,3 +24,7 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append 'root=/dev/hda' -display none"
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index bc1edd6..62160d4 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -21,3 +21,7 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append 'root=/dev/hda' -net nic,model=pcnet -net user -display none"
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index c654351..5bb4d15 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -21,3 +21,7 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append 'root=/dev/hda' -net nic,model=pcnet -net user -display none"
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index a6ced5e..15a624f 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -21,3 +21,7 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M g3beige -kernel output/images/vmlinux -hda output/images/rootfs.ext2 -append 'console=ttyS0 root=/dev/hda' -serial stdio -net nic,model=rtl8139 -net user -display none"
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 745a3ca..812b589 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -20,3 +20,7 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M mpc8544ds -kernel output/images/vmlinux -serial stdio -net nic,model=e1000 -net user -display none"
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index f79feb5..3787dd6 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -21,3 +21,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M virtex-ml507 -kernel output/images/vmlinux -m 256 -append 'console=ttyS0' -display none"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index bcd50dd..17f9b17 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -25,3 +25,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.53"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide -append 'root=/dev/sda console=ttySC1,115200 noiotrap' -serial null -serial stdio -net nic,model=rtl8139 -net user -display none"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 82f5485..3c6aab7 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -16,3 +16,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="1.6.1"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append 'root=/dev/sda console=ttyS0,115200' -serial stdio -net nic,model=lance -net user -display none"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 811f968..96afc7d 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -19,3 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.12.config"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append 'root=/dev/sda' -net nic,model=rtl8139 -net user -display curses"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index d642c45..7e5410d 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -20,3 +20,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.12.config"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append 'root=/dev/sda' -net nic,model=rtl8139 -net user -display curses"
-- 
1.8.3.2
