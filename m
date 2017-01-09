From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 21:15:13 +0100
Subject: [Buildroot] [git commit] configs/warp7: Bump U-Boot to 2017.01
	version
Message-ID: <20170109201549.1C3B580450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f95c5ee4de69fc015307cd612258dd8d17d045c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/warp7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 90a7338..c18a782 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # wifi firmware for brcm43430
