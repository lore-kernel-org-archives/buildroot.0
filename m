From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Tue, 28 Jul 2015 22:56:53 +0300
Subject: [Buildroot] [PATCH 1/1] configs/riotboard: bump u-boot to version
	2015.07
Message-ID: <1438113413-22290-1-git-send-email-picmaster@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
---
 configs/riotboard_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 7d37c25..98fdd6f 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_VERSION="2015.04"
+BR2_TARGET_UBOOT_VERSION="2015.07"
 BR2_TARGET_UBOOT_BOARDNAME="riotboard"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
-- 
1.7.10.4
