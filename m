From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 May 2016 14:03:12 +0200
Subject: [Buildroot] [git commit] configs: warpboard: Use the final U-boot
	release version
Message-ID: <20160509120456.952D680755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=098ff7f9026a58609b1ada18eedd79f5d6b809b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We should better use the final U-boot version rather than the release
candidate one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/warpboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 8bc3117..798afed 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -31,7 +31,7 @@ BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07-rc2"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # host utility
