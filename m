From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:36:17 +0200
Subject: [Buildroot] [git commit] configs/engicam_imx6qdl_icore_rqs: fix
 incorrect use of uboot defconfig file
Message-ID: <20190401203324.16A11811C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c42487beaa8f87567ca6aaf1902accb953dc6ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In u-boot v2017.09 release, configs/imx6qdl_icore_rqs_mmc_defconfig
was renamed to configs/imx6qdl_icore_rqs_defconfig. So use correct
defconfig file name.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/engicam_imx6qdl_icore_rqs_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/engicam_imx6qdl_icore_rqs_defconfig b/configs/engicam_imx6qdl_icore_rqs_defconfig
index 7ebe981c65..f79ccac27e 100644
--- a/configs/engicam_imx6qdl_icore_rqs_defconfig
+++ b/configs/engicam_imx6qdl_icore_rqs_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_rqs_mmc"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_rqs"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
