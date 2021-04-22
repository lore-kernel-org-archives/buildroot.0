From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 22 Apr 2021 20:25:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.0.3
Message-ID: <20210422182538.9384-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2021-April/000627.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index cac50e5b92..9c0079c3f9 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.0.2
+MESA3D_HEADERS_VERSION = 21.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f171d97a68..6a70e8a1b2 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-April/000625.html
-sha256  46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88  mesa-21.0.2.tar.xz
-sha512  c3d7969b56e1c31ee642e3b7143d565c4233173dab7cc5576b686c873c27134dc8292a9f2caa0a0dd3c54d0c89d27d6030f36a2c84f85dcedee7ae80b19e5c3b  mesa-21.0.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-April/000627.html
+sha256  565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b  mesa-21.0.3.tar.xz
+sha512  4a8aee48a8ea7f32e8aa3bbbd91db26c6053b9a43e62ff88256929e6bc147884f0fef988726b5a3d59d7008663f017c746a0352fd3fcc1c476b8190af4a2531f  mesa-21.0.3.tar.xz
 
 # License
 sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 697be8d9d5..a278d3dbdb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.0.2
+MESA3D_VERSION = 21.0.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.29.2
