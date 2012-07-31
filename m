From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:08:28 +0200
Subject: [Buildroot] [git commit] Update s6lx9 microblaze default
	configuration
Message-ID: <20120731213819.170688A2E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd1180b7cf5140d291741416e13bdb444712892d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/s6lx9_microboard_defconfig |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
index 5011766..05b4443 100644
--- a/configs/s6lx9_microboard_defconfig
+++ b/configs/s6lx9_microboard_defconfig
@@ -12,6 +12,5 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/avnet/s6lx9_microboard/lx9_mmu_defconfig"
-BR2_LINUX_KERNEL_DTS_FILE="board/avnet/s6lx9_microboard/lx9_mmu.dts"
-BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="simpleImage.lx9_mmu"
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/avnet/s6lx9_microboard/lx9_mmu.dts"
