From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu,  4 Jan 2018 12:39:44 +0100
Subject: [Buildroot] [PATCH v2 12/15] imx-uuc: bump revision to 2ae63428
In-Reply-To: <20180104113947.21235-1-gary.bisson@boundarydevices.com>
References: <20180104113947.21235-1-gary.bisson@boundarydevices.com>
Message-ID: <20180104113947.21235-13-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Setup utp via configfs
- Fix many compiler warnings
- Robustness improved

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-uuc/imx-uuc.hash | 2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
index d6e4d97ea0..c9c29f8692 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.hash
+++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 eac0c3e288c845cd9b82d02993f8358731a7a03e51591b27feeb453b143beb73  imx-uuc-3440b1108373e79669cc17ba1d2be91a123a2053.tar.gz
+sha256 1463e855d1229e6b6c02df2085f6bff5974bc061d13a61646b63675c160cba99  imx-uuc-2ae634281a39c82b6a8ee0fdcfbfbe42183ceb53.tar.gz
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index f24216da26..5e0bb3be0e 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.mk
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_UUC_VERSION = 3440b1108373e79669cc17ba1d2be91a123a2053
-IMX_UUC_SITE = $(call github,NXPmicro,imx-uuc,$(IMX_UUC_VERSION))
+IMX_UUC_VERSION = 2ae634281a39c82b6a8ee0fdcfbfbe42183ceb53
+IMX_UUC_SITE = $(call github,codeauroraforum,imx-uuc,$(IMX_UUC_VERSION))
 IMX_UUC_LICENSE = GPL-2.0+
 IMX_UUC_LICENSE_FILES = COPYING
 
-- 
2.15.1
