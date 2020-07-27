From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 18:01:44 +0200
Subject: [Buildroot] [git commit] configs/imx6ullevk_defconfig: remove typo
Message-ID: <20200727155726.668C98219D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e215692c612c574d6c203105e023f27f847bac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by check-dotconfig.py.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/657885169

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/imx6ullevk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 4a5558dd6c..81db66268a 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
-BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
 # required tools to create the SD card image
