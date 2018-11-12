From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 12 Nov 2018 10:44:02 +0100
Subject: [Buildroot] [PATCH] imx-uuc: bump revision to 79e9798e
Message-ID: <20181112094402.1815-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Main changes:
- fix build error by gcc 8.2
- re-factor the code
- use unique CPU ID when available
- improve UDC management

Fixes:
http://autobuild.buildroot.net/results/b39d56c1573308c4f947de23363da7c05e2aaf0d/

Also switch back the repository from codeauroraforum to NXPmicro now
that the Qualcomm/NXP merger was denied.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-uuc/imx-uuc.hash | 2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
index c9c29f8692..623bd27644 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.hash
+++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1463e855d1229e6b6c02df2085f6bff5974bc061d13a61646b63675c160cba99  imx-uuc-2ae634281a39c82b6a8ee0fdcfbfbe42183ceb53.tar.gz
+sha256 ac4960b9dc53cfd09709951c4bf1f774567ff0918d0b216b480e1f7df8c6ee48  imx-uuc-79e9798eee9cd972d92ed2b18f170de856d153c9.tar.gz
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index 5e0bb3be0e..bdfa51b171 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.mk
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_UUC_VERSION = 2ae634281a39c82b6a8ee0fdcfbfbe42183ceb53
-IMX_UUC_SITE = $(call github,codeauroraforum,imx-uuc,$(IMX_UUC_VERSION))
+IMX_UUC_VERSION = 79e9798eee9cd972d92ed2b18f170de856d153c9
+IMX_UUC_SITE = $(call github,NXPmicro,imx-uuc,$(IMX_UUC_VERSION))
 IMX_UUC_LICENSE = GPL-2.0+
 IMX_UUC_LICENSE_FILES = COPYING
 
-- 
2.19.1
