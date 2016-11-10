From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 10 Nov 2016 13:39:45 -0200
Subject: [Buildroot] [PATCH 1/4] configs/imx233_olinuxino: Add EXT4 support
Message-ID: <1478792388-13279-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select BR2_TARGET_ROOTFS_EXT4 so that an EXT4 rootfs can be generated.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/olimex_imx233_olinuxino_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 1040e5e..70e8b5d 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -32,6 +32,7 @@ BR2_PACKAGE_ZD1211_FIRMWARE=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # U-Boot
-- 
2.7.4
