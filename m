From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:55:47 +0200
Subject: [Buildroot] [git commit] configs/wandboard: Bump to U-Boot 2016.09
Message-ID: <20160912205558.F14F182133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c97dcbc1f43e783af4f6200f65152a1b9a1851d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/wandboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 67041a6..18d30d9 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="wandboard"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
