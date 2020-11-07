From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 13:20:46 +0100
Subject: [Buildroot] [git commit] configs/orangepi_zero_plus: use Python 3.x
 for U-Boot build
Message-ID: <20201107120743.2E033876B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49624ab4555ea1b8c15e2c9e28a13946a15f04b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New U-Boot versions (such as 2020.10 being used) need Python 3.x for
pylibfdt.

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/831421115

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_zero_plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index cff2788f04..cf82f8b3cc 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
