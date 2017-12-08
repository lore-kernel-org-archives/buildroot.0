From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 19:05:16 +0100
Subject: [Buildroot] [git commit] configs/orangepi_lite: bump u-boot to
 2017.11
Message-ID: <20171208181255.964B882875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=266c420e1ac8525e9bdc50f2a3dc6b34a5a89882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_lite_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index 3222275..b1f6598 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
