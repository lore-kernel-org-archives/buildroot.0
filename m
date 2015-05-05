From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Tue,  5 May 2015 09:39:38 +0300
Subject: [Buildroot] [PATCH v2 1/1] configs/riotboard: bump u-boot to
	version 2015.04
Message-ID: <1430807978-24288-1-git-send-email-picmaster@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
---
Changes v1 -> v2:
  - None, just did additional testing. v1 was rejected on my request as I
    suspected that u-boot v2015.04 breaks the network interface, but this
    is not the case and all works fine.

 configs/riotboard_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 6e581fa..72c3e04 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_VERSION="2015.01"
+BR2_TARGET_UBOOT_VERSION="2015.04"
 BR2_TARGET_UBOOT_BOARDNAME="riotboard"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
-- 
1.7.10.4
