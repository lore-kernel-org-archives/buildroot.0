From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 22:47:51 +0100
Subject: [Buildroot] [git commit] defconfigs: update microblaze defconfigs
	to use new toolchain
Message-ID: <20131206215056.861849BF34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3d401803173f754854ea31f569b1806e6d1c4d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_microblazebe_mmu_defconfig |    7 -------
 configs/qemu_microblazeel_mmu_defconfig |    7 -------
 2 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index c090143..f22243f 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -2,13 +2,6 @@
 BR2_microblaze=y
 BR2_microblazebe=y
 
-# Special toolchain
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
-
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 7538d3f..3d6daa2 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -2,13 +2,6 @@
 BR2_microblaze=y
 BR2_microblazeel=y
 
-# Toolchain
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
-
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 
