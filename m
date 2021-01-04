From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Mon,  4 Jan 2021 18:38:15 +0100
Subject: [Buildroot] [PATCH 3/8] package/freescale-imx/imx-seco: bump
 version to 3.7.4
In-Reply-To: <20210104173820.6720-1-stephane.viau@oss.nxp.com>
References: <20210104173820.6720-1-stephane.viau@oss.nxp.com>
Message-ID: <20210104173820.6720-4-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version is aligned with 5.4.70_2.3.0 NXP Linux BSP.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/freescale-imx/imx-seco/imx-seco.hash | 6 +++---
 package/freescale-imx/imx-seco/imx-seco.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
index c8526d2b57..2e111c64d7 100644
--- a/package/freescale-imx/imx-seco/imx-seco.hash
+++ b/package/freescale-imx/imx-seco/imx-seco.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b09f63139df6c4dfef3533570cd60b22eb4c48eed05f314268178e80b8de40fc  imx-seco-3.7.1.bin
-sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
-sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
+sha256  2ed8177e48c8e33f742b3a642805be56a5ef56df78b1b29e10518552154da2bc  imx-seco-3.7.4.bin
+sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
+sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index cc46ad7e5d..f7aaca7e4b 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SECO_VERSION = 3.7.1
+IMX_SECO_VERSION = 3.7.4
 IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
 IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
 
-- 
2.29.2
