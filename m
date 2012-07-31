From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:08:29 +0200
Subject: [Buildroot] [git commit] Update qemu microblazebe default
	configuration
Message-ID: <20120731213819.3EAAF96FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27f7eca576ef6a8f1bb333cf982c1173bc05c480
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/qemu_microblazebe_mmu_defconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 387466b..619ecbf 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -22,6 +22,6 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/kernel-3.3.config"
-BR2_LINUX_KERNEL_DTS_FILE="board/qemu/microblazebe-mmu/system.dts"
-BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="linux.bin"
+BR2_LINUX_KERNEL_LINUX_BIN=y
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
