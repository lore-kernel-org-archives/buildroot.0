From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Sep 2016 17:37:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump version to 12.0.2
Message-ID: <20160905153739.30453-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.hash | 4 ++--
 package/mesa3d/mesa3d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index fa01128..65c59a5 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2016-July/000227.html
-sha256	bab24fb79f78c876073527f515ed871fc9c81d816f66c8a0b051d8d653896389	mesa-12.0.1.tar.xz
+# From https://cgit.freedesktop.org/mesa/mesa/plain/docs/relnotes/12.0.2.html
+sha256 d957a5cc371dcd7ff2aa0d87492f263aece46f79352f4520039b58b1f32552cb  mesa-12.0.2.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 19dec49..12ceee8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 12.0.1
+MESA3D_VERSION = 12.0.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.9.3
