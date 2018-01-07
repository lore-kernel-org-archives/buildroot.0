From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:38:59 +0100
Subject: [Buildroot] [git commit] imx-uuc: bump revision to 2ae63428
Message-ID: <20180107144906.668E1802F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e24803edd09a3963b7c2fc03cff78528d74c7dd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Setup utp via configfs
- Fix many compiler warnings
- Robustness improved

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-uuc/imx-uuc.hash | 2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
index d6e4d97..c9c29f8 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.hash
+++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 eac0c3e288c845cd9b82d02993f8358731a7a03e51591b27feeb453b143beb73  imx-uuc-3440b1108373e79669cc17ba1d2be91a123a2053.tar.gz
+sha256 1463e855d1229e6b6c02df2085f6bff5974bc061d13a61646b63675c160cba99  imx-uuc-2ae634281a39c82b6a8ee0fdcfbfbe42183ceb53.tar.gz
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index f24216d..5e0bb3b 100644
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
 
