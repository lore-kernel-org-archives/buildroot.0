From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:31:24 +0100
Subject: [Buildroot] [git commit] configs/freescale_imx6qsabresd: U-Boot
 needs host-dtc
Message-ID: <20180306143236.D6D6A7FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b732fed265203a6c112007982c1ea601892f900f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306821

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx6qsabresd_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 613b48a913..e0ef20c578 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -40,3 +40,4 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
