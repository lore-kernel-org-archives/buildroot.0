From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 17:54:22 +0200
Subject: [Buildroot] [git commit] beaglebone: defconfigs: u-boot needs dtc
Message-ID: <20161019155436.3C5AA81E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae2dc85b89b644dd59ea7ef4c6d51d0070a024bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/168763221

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beaglebone_defconfig     | 1 +
 configs/beaglebone_qt5_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index a3efabf..eefa81c 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -18,6 +18,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 18ee139..a9ab5a2 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
