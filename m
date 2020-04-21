From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:08:03 +0200
Subject: [Buildroot] [git commit] configs/qemu_riscv*: remove
 BR2_TARGET_OPENSBI_USE_PLAT
Message-ID: <20200421195434.57C998FB47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dd067ef3ae92eda4d883dd002c4b48b60dd4e8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option never existed in opensbi package.

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_riscv32_virt_defconfig | 1 -
 configs/qemu_riscv64_virt_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 427ea47387..f47700f4ab 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -27,7 +27,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_USE_PLAT=y
 BR2_TARGET_OPENSBI_PLAT="qemu/virt"
 
 # host-qemu for gitlab testing
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 2125324aff..659a6046ed 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -26,7 +26,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_USE_PLAT=y
 BR2_TARGET_OPENSBI_PLAT="qemu/virt"
 
 # host-qemu for gitlab testing
