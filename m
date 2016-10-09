From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:43:23 +0200
Subject: [Buildroot] [git commit] configs/grinn_liteboard: Bump to U-Boot
	2016.09.01
Message-ID: <20161009204326.D28DB8047F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12e3d98d8fc8193bd565ae9d90f707574fdbca02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot 2016.09.01 is a bugfix release, so bump to this version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/grinn_liteboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index 5edb375..d82f7fe 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="liteboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
