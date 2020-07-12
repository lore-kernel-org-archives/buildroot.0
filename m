From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 10:56:10 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: bump
 version to 8.8
Message-ID: <20200712085642.E326C8684A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b2de1d86fc2c960b611b42112c75bfee9d19b04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with 5.4.24_2.1.0 NXP Linux BSP.

License was updated from:
LA_OPT_NXP_Software_License v10 December 2019
to:
LA_OPT_NXP_Software_License v11 February 2020
which explains the change of EULA/COPYING license files.

Tested-by: Julien Olivain <julien.olivain@oss.nxp.com>
[Julien: tested on i.MX8M Mini EVK Rev A with LPDDR4]
Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>
[Stephane: tested on i.MX8MQ and i.MX8MN]
Tested-by : Maeva Manuel <maeva.manuel@oss.nxp.com>
[Maeva: tested on i.MX8QM MEK rev B0 and i.MX8QXP MEK rev B0]
Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 54a3dafcc0..b0a150205c 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  a7f4a22c05a990aad43a616e312847ab9d85ce00691b34fa8590d5c7c1d722e9  firmware-imx-8.6.bin
-sha256  1360edf65a32b66d28bcf2d53a1a1c2dc88d4e254c15da3d8e37bf1b6f1f19a1  EULA
-sha256  30ba26ae82fba4033513b67c2c3a00b00e78908d278568a7d648d3430875123a  COPYING
+sha256  5ca1f8b6e6b191594d17ac7b51c38cdbc2ff808d15568ab4b0bbeb5dc6c621f6  firmware-imx-8.8.bin
+sha256  7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
+sha256  2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index ed8a81bcc5..cd299aad5e 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.6
+FIRMWARE_IMX_VERSION = 8.8
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
