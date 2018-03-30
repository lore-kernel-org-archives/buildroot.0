From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 19:06:36 +0200
Subject: [Buildroot] [git commit branch/2018.02.x]
 configs/freescale_imx6sololiteevk: U-Boot needs host-dtc
Message-ID: <20180330193202.8ABC5816A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60c40e84e2b4e1e3e23e379e776eff8de4641e6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306822

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3982d28cfbdcaf34a844fdce63ef68634adcf79f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx6sololiteevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 1b3546255a..b840f2f185 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -36,3 +36,4 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
