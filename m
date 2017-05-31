From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:58:19 +0200
Subject: [Buildroot] [git commit] configs/lego_ev3: bump U-Boot version
Message-ID: <20170601202901.21FFF8294C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb47cdbee39ab54959b52caa3ba17a6007464a23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps U-Boot to the current stable version (2017.05).

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/lego_ev3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 4d764c5..0c1ab01 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -36,7 +36,7 @@ BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
 
 # host
