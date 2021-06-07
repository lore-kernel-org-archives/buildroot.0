From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:18:11 -0000
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 21.1.1
Message-ID: <20210607144655.93CE881191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5594bb01768e851ec75787235ac1cfcf2c4807f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2021-May/000631.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 308c6701ab..143de09937 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.1.0
+MESA3D_HEADERS_VERSION = 21.1.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b9eace0b42..9548f8d170 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-May/000630.html
-sha256  0128f10e22970d3aed3d1034003731f94623015cd9797c07151417649c1b1ff8  mesa-21.1.0.tar.xz
-sha512  9d7617a6d5dd8ec1d93fdda8fe8b2f745695c02bc381d685f1257f7e7f08d5c06f3c57ae71c5f2dfaabb1742b8a88f47294a369bd3ac553f29835f24ce5dd350  mesa-21.1.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-May/000631.html
+sha256  eec25ea379054e8911bc5de816aeb50f581b5b708414725003d2f00386b38dd2  mesa-21.1.1.tar.xz
+sha512  79d0e2b0e1e590e7f36a082df3584010a553af0b3060bd2d3a7ace700ac7a8d1b7734ba67f2e193dd441434eeec74a16e0dbcbf8c15061b5dd5d6a1feca73d62  mesa-21.1.1.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1425cb7217..aa81cd10a8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.1.0
+MESA3D_VERSION = 21.1.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
