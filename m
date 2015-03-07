From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Mar 2015 10:11:51 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/mesa3d: bump version to 10.4.6
Message-ID: <1425719512-2593-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated hash (Thomas)

 package/mesa3d/mesa3d.hash |    4 ++--
 package/mesa3d/mesa3d.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 677781f..9d193dc 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://cgit.freedesktop.org/mesa/mesa/commit/?h=10.4&id=41bdeda10210b8f1d358c04b25af2fbfe3335531
-sha256	bf60000700a9d58e3aca2bfeee7e781053b0d839e61a95b1883e05a2dee247a0	MesaLib-10.4.5.tar.bz2
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-March/000144.html
+sha256	d8baedd20e79ccd98a5a7b05e23d59a30892e68de1fcc057ca6873dafca02735	MesaLib-10.4.6.tar.bz2
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9134d72..811a1ef 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 10.4.5
+MESA3D_VERSION = 10.4.6
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
