From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Sep 2019 14:37:05 +0200
Subject: [Buildroot] [PATCH v11 11/13] package/{mesa3d,
 mesa3d-headers}: bump version to 19.1.5
In-Reply-To: <20190901123707.19342-1-bernd.kuhls@t-online.de>
References: <20190901123707.19342-1-bernd.kuhls@t-online.de>
Message-ID: <20190901123707.19342-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 11 ++++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 9d6980c3d7..02eea1f41b 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.0.8
+MESA3D_HEADERS_VERSION = 19.1.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 0b82342fc6..d7b8ccb94a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-June/000525.html
-md5 9634964d87f1ce8d0230493e43f34c50  mesa-19.0.8.tar.xz
-sha1 5fd340a6304f7501014e1bd7291e4cfa7a6efcdb  mesa-19.0.8.tar.xz
-sha256 d017eb53a810c32dabeedf6ca2238ae1e897ce9090e470e9ce1d6c9e3f1b0862  mesa-19.0.8.tar.xz
-sha512 fbddc3a74f223564343027380af776b3fa5d63fe1af4e34121273235d1c6eced96439f601eb19bf658eb927aff3965b520f0329fcbd4650f3112167303e1746d  mesa-19.0.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-August/000537.html
+md5 f64a67ac6f274acc84cd1fd7e325ce98  mesa-19.1.5.tar.xz
+sha1 7a80ac32b4da4066dd00b3dc8274682be18b35cb  mesa-19.1.5.tar.xz
+sha256 7b54e14e35c7251b171b4cf9d84cbc1d760eafe00132117db193454999cd6eb4  mesa-19.1.5.tar.xz
+sha512 4d4b3733c13e5c9b3172127f2565b827dc46aab69bdc86791c457ad137a5571c51e3c3a26d5a99e11fe552829a1220028a3968f3086959e038c615f2d75675a4  mesa-19.1.5.tar.xz
+
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 93f246ddc2..fd85192905 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.0.8
+MESA3D_VERSION = 19.1.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
