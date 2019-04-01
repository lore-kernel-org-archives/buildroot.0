From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:35:45 +0200
Subject: [Buildroot] [git commit] configs/engicam_imx6ul_isiot: bump to
 U-Boot 2019.01
Message-ID: <20190401203324.0A59E811C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e672a0220a44cf46ba2850979302b9fa6e07c1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/engicam_imx6ul_isiot_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/engicam_imx6ul_isiot_defconfig b/configs/engicam_imx6ul_isiot_defconfig
index 9ba11361e7..57a66dea34 100644
--- a/configs/engicam_imx6ul_isiot_defconfig
+++ b/configs/engicam_imx6ul_isiot_defconfig
@@ -14,7 +14,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ul_isiot_emmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
