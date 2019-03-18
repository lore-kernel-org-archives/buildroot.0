From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:57:50 +0100
Subject: [Buildroot] [git commit] configs/qemu_riscv64_virt: re-order options
Message-ID: <20190318215505.A49718E203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19064985e8383b205536b5468f2c3261f11eb70d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the config layout, no functional change.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_riscv64_virt_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 65dbef4135..596edf2fcd 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -4,11 +4,11 @@ BR2_RISCV_64=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Linux headers same as kernel, a 4.20 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
