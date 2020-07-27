From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Jul 2020 17:51:22 +0200
Subject: [Buildroot] [PATCHv3 1/6] configs/imx6ullevk_defconfig: remove typo
Message-ID: <20200727155127.2703286-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported by check-dotconfig.py.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/657885169

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.25.4
