From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Jun 2021 08:00:48 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.1.2
Message-ID: <20210603060048.92598-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2021-June/000632.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 143a01180f..1b56494571 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.1.0
+MESA3D_HEADERS_VERSION = 21.1.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b9eace0b42..8bd98ec6e5 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-May/000630.html
-sha256  0128f10e22970d3aed3d1034003731f94623015cd9797c07151417649c1b1ff8  mesa-21.1.0.tar.xz
-sha512  9d7617a6d5dd8ec1d93fdda8fe8b2f745695c02bc381d685f1257f7e7f08d5c06f3c57ae71c5f2dfaabb1742b8a88f47294a369bd3ac553f29835f24ce5dd350  mesa-21.1.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-June/000632.html
+sha256  23b4b63760561f3a4f98b5be12c6de621e9a6bdf355e087a83d9184cd4e2825f  mesa-21.1.2.tar.xz
+sha512  a7907fa29fdb4e137015ee5405b9c8c0769ef9354bbe963c1af80318b398c05c79db6129b583106d620c42a5e9b625611b648fd5207334eb9b588d7963defc70  mesa-21.1.2.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 218d2a3701..34bcd4df34 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.1.0
+MESA3D_VERSION = 21.1.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.29.2
