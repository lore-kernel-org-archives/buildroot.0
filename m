From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 22:52:12 +0100
Subject: [Buildroot] [git commit branch/next] configs/warp7: Bump to U-Boot
	2016.11
Message-ID: <20161114215221.B8029817A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87f1bdda38b43192908dab585dc6b4fc3e39ffe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/warp7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index a55a504..fca7a1d 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7_secure"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # wifi firmware for brcm43430
