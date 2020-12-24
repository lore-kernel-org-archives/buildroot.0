From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Thu, 24 Dec 2020 07:59:39 +0100
Subject: [Buildroot] [PATCH 01/15] package/freescale-imx/firmware-imx: bump
 version to 8.9
In-Reply-To: <1608793193-11843-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1608793193-11843-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1608793193-11843-2-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version is aligned with 5.4.47_2.2.0 NXP Linux BSP.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index b0a1502..3230677 100644
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
index fb3cfe6..7d1f42f 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.8
+FIRMWARE_IMX_VERSION = 8.9
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.7.4
