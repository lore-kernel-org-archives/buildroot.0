From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 16:23:46 +0100
Subject: [Buildroot] [git commit branch/next]
	configs/olimex_imx233_olinuxino: Add EXT4 support
Message-ID: <20161111153439.36471819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12b7cf60606e4e82acf9f29454bab6ba40457777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Select BR2_TARGET_ROOTFS_EXT4 so that an EXT4 rootfs can be generated.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
