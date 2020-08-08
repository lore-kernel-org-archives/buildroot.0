From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 19:50:01 +0200
Subject: [Buildroot] [git commit branch/next]
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev: use bluez5-utils instead of
 bluez-utils
Message-ID: <20200812144328.B16F685F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8efd11e0c3622a1a70087f033b998725b3adb6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

bluez-utils has been removed, so use bluez5-utils instead for the
microchip_sama5d27-wlsom1_ek_mmc_dev configuration, to avoid a build
failure due to legacy options being selected.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934030

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
index 200b365353..031a533bc9 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
@@ -50,7 +50,7 @@ BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
 BR2_PACKAGE_ARGP_STANDALONE=y
-BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
 BR2_PACKAGE_ETHTOOL=y
