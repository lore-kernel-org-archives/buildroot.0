From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:30:25 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: bump
 version to 8.9
Message-ID: <20201226171348.0958581540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd68c593dd753c879d970b6fdc9756251a56e315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with 5.4.47_2.2.0 NXP Linux BSP.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index b0a150205c..3230677d49 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5ca1f8b6e6b191594d17ac7b51c38cdbc2ff808d15568ab4b0bbeb5dc6c621f6  firmware-imx-8.8.bin
-sha256  7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
-sha256  2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
+sha256  a72f70fd2ecaa58800bb88ed672fddc322ab9843ee7777eb89b82016b0aa3614  firmware-imx-8.9.bin
+sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
+sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index fb3cfe640b..7d1f42f1d8 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.8
+FIRMWARE_IMX_VERSION = 8.9
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
