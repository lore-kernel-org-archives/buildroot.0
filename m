From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  3 Oct 2016 09:23:32 -0300
Subject: [Buildroot] [PATCH 1/2] configs/olimex_a20_olinuxino_lime: Bump to
	U-Boot 2016.09.01
Message-ID: <1475497413-27708-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot 2016.09.01 is a bugfix release, so bump to this version.

Cc: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/olimex_a20_olinuxino_lime_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 97c1ced..49987fe 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -34,7 +34,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.7.4
