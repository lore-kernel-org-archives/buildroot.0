From: David Lechner <david@lechnology.com>
Date: Tue, 23 May 2017 13:04:04 -0500
Subject: [Buildroot] [PATCH 1/3] lego: ev3: Bump U-Boot version
In-Reply-To: <1495562646-4410-1-git-send-email-david@lechnology.com>
References: <1495562646-4410-1-git-send-email-david@lechnology.com>
Message-ID: <1495562646-4410-2-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bumps U-Boot to the current stable version (2017.05).

Signed-off-by: David Lechner <david@lechnology.com>
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
-- 
2.7.4
