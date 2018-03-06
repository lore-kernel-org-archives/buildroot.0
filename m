From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:30:36 +0100
Subject: [Buildroot] [git commit] configs/freescale_imx6dlsabreauto: U-Boot
 needs host-dtc
Message-ID: <20180306143236.9BC7F7FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=770a75600ccfa0be6ec783340c2cd6cc9cfa3a72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306818

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx6dlsabreauto_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 19c1cc286a..55db461f44 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -40,3 +40,4 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
