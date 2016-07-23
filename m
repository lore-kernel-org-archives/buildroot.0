From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:01:14 +0200
Subject: [Buildroot] [git commit] configs: warpboard: Bump to U-Boot 2016.07
Message-ID: <20160723130123.CC911806A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d6344199562e78dcf92f99c076a926b1de5c5c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot 2016.07 works well on warpboard, so bump to this version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/warpboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index d3cffb9..8dfe52e 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -31,7 +31,7 @@ BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # host utility
