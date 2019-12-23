From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 19:01:16 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] configs/licheepi_zero:
 U-Boot needs pylibfdt
Message-ID: <20191223175228.5C4C68DFBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66add2443fbf066bca05df08f1e561c9714c95db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Like all Allwinner platforms, building the licheepi_zero U-Boot
configuration requires pylibfdt.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314331

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f2c11f1434874cef61a9cdf128959c16dd7898be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/licheepi_zero_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index 8bb21292ca..fd875d5f4c 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -39,6 +39,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
