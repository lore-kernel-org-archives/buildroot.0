From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Jul 2021 16:47:19 +0200
Subject: [Buildroot] [PATCH v2] package/{mesa3d,
 mesa3d-headers}: bump version to 21.1.5
Message-ID: <20210715144719.36875-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch site to https://archive.mesa3d.org

Release notes:
- 21.1.2
  https://lists.freedesktop.org/archives/mesa-announce/2021-June/000632.html
- 21.1.3
  https://lists.freedesktop.org/archives/mesa-announce/2021-June/000633.html
- 21.1.4
  https://lists.freedesktop.org/archives/mesa-announce/2021-June/000635.html
- 21.1.5
  https://lists.freedesktop.org/archives/mesa-announce/2021-July/000637.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: switched site to https://archive.mesa3d.org (Peter Seiderer)

 package/mesa3d-headers/mesa3d-headers.mk | 4 ++--
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 960bd83344..6cf50e23de 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,9 +12,9 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.1.1
+MESA3D_HEADERS_VERSION = 21.1.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
-MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
+MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
 MESA3D_HEADERS_LICENSE_FILES = docs/license.rst
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9548f8d170..bf744377e4 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-May/000631.html
-sha256  eec25ea379054e8911bc5de816aeb50f581b5b708414725003d2f00386b38dd2  mesa-21.1.1.tar.xz
-sha512  79d0e2b0e1e590e7f36a082df3584010a553af0b3060bd2d3a7ace700ac7a8d1b7734ba67f2e193dd441434eeec74a16e0dbcbf8c15061b5dd5d6a1feca73d62  mesa-21.1.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-July/000637.html
+sha256  022c7293074aeeced2278c872db4fa693147c70f8595b076cf3f1ef81520766d  mesa-21.1.5.tar.xz
+sha512  d9e0e1b6a1d717febee2aa67b06620c9a21e061ea7e594be5b4c382db1ed6f5acf5d13a75a9f2bba9c32621466ebc816708606e16e8b34700d987158fd8f0b7b  mesa-21.1.5.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a30b4aff31..b38718bab5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.1.1
+MESA3D_VERSION = 21.1.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
-MESA3D_SITE = https://mesa.freedesktop.org/archive
+MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.rst
 MESA3D_CPE_ID_VENDOR = mesa3d
-- 
2.30.2
