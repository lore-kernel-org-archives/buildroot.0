From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 19 Oct 2016 16:23:07 +0200
Subject: [Buildroot] [PATCH 2/4] imx-uuc: switch to open source version
In-Reply-To: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
References: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
Message-ID: <20161019142309.15628-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tool will be maintained as an open source project.
The repository can be found at:
https://github.com/NXPmicro/imx-uuc

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/9b56bf13

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-uuc/imx-uuc.hash | 2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
index 05501c8..d6e4d97 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.hash
+++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 95d7f7b075f58fedc07602fbc0e5bf5212d28deea3d09cdbcbd80992dcd18482  imx-uuc-0.5.1.tar.gz
+sha256 eac0c3e288c845cd9b82d02993f8358731a7a03e51591b27feeb453b143beb73  imx-uuc-3440b1108373e79669cc17ba1d2be91a123a2053.tar.gz
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index 58e749e..12d9312 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.mk
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_UUC_VERSION = 0.5.1
-IMX_UUC_SITE = $(FREESCALE_IMX_SITE)
+IMX_UUC_VERSION = 3440b1108373e79669cc17ba1d2be91a123a2053
+IMX_UUC_SITE = $(call github,NXPmicro,imx-uuc,$(IMX_UUC_VERSION))
 IMX_UUC_LICENSE = GPLv2+
 IMX_UUC_LICENSE_FILES = COPYING
 
-- 
2.9.3
