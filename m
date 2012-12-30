From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Dec 2012 12:32:03 +0100
Subject: [Buildroot] [git commit] qemu/microblaze: update to use kernel 3.7.1
Message-ID: <20121230113338.E6B099A555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fdfc7db1eb473f49a50a775d90f611e0a46227f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.6.config => linux-3.7.config}         |    0
 board/qemu/microblazebe-mmu/readme.txt             |    2 +-
 .../{linux-3.6.config => linux-3.7.config}         |    0
 board/qemu/microblazeel-mmu/readme.txt             |    2 +-
 configs/qemu_microblazebe_mmu_defconfig            |    4 ++--
 configs/qemu_microblazeel_mmu_defconfig            |    4 ++--
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/qemu/microblazebe-mmu/linux-3.6.config b/board/qemu/microblazebe-mmu/linux-3.7.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-3.6.config
rename to board/qemu/microblazebe-mmu/linux-3.7.config
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 889b561..a52b9ad 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.2.0
+Tested with QEMU 1.3.0
diff --git a/board/qemu/microblazeel-mmu/linux-3.6.config b/board/qemu/microblazeel-mmu/linux-3.7.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-3.6.config
rename to board/qemu/microblazeel-mmu/linux-3.7.config
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 9bc5440..e61eeb6 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.2.0
+Tested with QEMU 1.3.0
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 6ca7cc9..6f5c871 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.7.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index a4e13d2..6f9f8f9 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.7.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazeel-mmu/system.dts"
