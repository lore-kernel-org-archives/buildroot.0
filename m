From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 13 Nov 2013 15:28:50 -0600
Subject: [Buildroot] [PATCH v3 7/7] defconfigs: update microblaze defconfigs
	to use new toolchain
In-Reply-To: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
References: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1384378130-8599-8-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 configs/qemu_microblazebe_mmu_defconfig |    7 -------
 configs/qemu_microblazeel_mmu_defconfig |    7 -------
 2 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 0a621b1..8527ca8 100644
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
index 51d58c6..e407e1b 100644
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
 
-- 
1.7.1
