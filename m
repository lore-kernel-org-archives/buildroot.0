From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:30:29 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-seco: bump
 version to 3.7.1
Message-ID: <20201226171348.3E50E816CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ecc1e55612c40851656b9347720a2908e6b7ff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with 5.4.47_2.2.0 NXP Linux BSP.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-seco/imx-seco.hash | 6 +++---
 package/freescale-imx/imx-seco/imx-seco.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
index 930801e839..c8526d2b57 100644
--- a/package/freescale-imx/imx-seco/imx-seco.hash
+++ b/package/freescale-imx/imx-seco/imx-seco.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  52ba07633e0f8707d8c26724b5cd03ef96444c8de1e0e134acac50acacf3e7dd  imx-seco-3.6.3.bin
-sha256  7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
-sha256  2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
+sha256  b09f63139df6c4dfef3533570cd60b22eb4c48eed05f314268178e80b8de40fc  imx-seco-3.7.1.bin
+sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
+sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index be3f3c4419..cc46ad7e5d 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SECO_VERSION = 3.6.3
+IMX_SECO_VERSION = 3.7.1
 IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
 IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
 
