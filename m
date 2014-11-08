From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Nov 2014 19:40:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump to 10.3.3
Message-ID: <1415472007-18145-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.hash |    4 ++--
 package/mesa3d/mesa3d.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 1c5de2d..bdcccaa 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2014-October/000116.html
-sha256	e9849bcb9aa9acd98a753d6d46d2e7d7238d3367036e11357a60efd16de8bea3	MesaLib-10.3.2.tar.bz2
+# From http://lists.freedesktop.org/archives/mesa-announce/2014-November/000122.html
+sha256	0e4eee4a2ddf86456eed2fc44da367f95471f74249636710491e85cc256c4753	MesaLib-10.3.3.tar.bz2
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6f1f414..4eaf07c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.3.2
+MESA3D_VERSION = 10.3.3
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
