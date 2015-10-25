From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Sun, 25 Oct 2015 03:12:58 +0200
Subject: [Buildroot] [PATCH 2/2] configs/riotboard: bump u-boot to version
	2015.10
In-Reply-To: <1445735578-18117-1-git-send-email-picmaster@mail.bg>
References: <1445735578-18117-1-git-send-email-picmaster@mail.bg>
Message-ID: <1445735578-18117-2-git-send-email-picmaster@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
---
 configs/riotboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 96c3619..7795787 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.10"
 BR2_TARGET_UBOOT_BOARDNAME="riotboard"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
-- 
2.1.4
