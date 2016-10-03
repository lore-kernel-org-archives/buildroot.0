From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Oct 2016 14:27:12 +0200
Subject: [Buildroot] [git commit] configs/orangepipc: Bump to U-Boot
	2016.09.01
Message-ID: <20161003122741.22F52807B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1f361431eed7635958745d0062cbee832a53aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot 2016.09.01 is a bugfix release, so bump to this version.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepipc_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index 1bea541..6d3a842 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
