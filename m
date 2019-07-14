From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:59:56 +0200
Subject: [Buildroot] [git commit] package/imx-uuc: bump to version
 fc48b497fe961d601b4bcced807f562090854ec9
Message-ID: <20190714135832.18C2581270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb9c86a31c7933d2a320644be9cfff4be71a3206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-uuc/imx-uuc.hash | 3 ++-
 package/freescale-imx/imx-uuc/imx-uuc.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
index 623bd27644..57a5098597 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.hash
+++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 ac4960b9dc53cfd09709951c4bf1f774567ff0918d0b216b480e1f7df8c6ee48  imx-uuc-79e9798eee9cd972d92ed2b18f170de856d153c9.tar.gz
+sha256 2784e0826074335893fdad20e9a4faaedced2f206565c383043fbd169e9273a4  imx-uuc-fc48b497fe961d601b4bcced807f562090854ec9.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index e94648b832..040d7bd874 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.mk
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_UUC_VERSION = 79e9798eee9cd972d92ed2b18f170de856d153c9
+IMX_UUC_VERSION = fc48b497fe961d601b4bcced807f562090854ec9
 IMX_UUC_SITE = $(call github,NXPmicro,imx-uuc,$(IMX_UUC_VERSION))
 IMX_UUC_LICENSE = GPL-2.0+
 IMX_UUC_LICENSE_FILES = COPYING
