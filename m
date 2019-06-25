From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 25 Jun 2019 19:01:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 19.0.7
Message-ID: <20190625170105.28010-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 17b1dea428..d3cb6f4d09 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.0.6
+MESA3D_HEADERS_VERSION = 19.0.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 661e2670f3..27868623d4 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-June/000519.html
-md5 b97159690eba564311d88a818bdbd64d  mesa-19.0.6.tar.xz
-sha1 d57360ade1b7a5406de2f560829d6ec7783217b1  mesa-19.0.6.tar.xz
-sha256 2db2f2fcaa4048b16e066fad76b8a93944f7d06d329972b0f5fd5ce692ce3d24  mesa-19.0.6.tar.xz
-sha512 320fd6b12ccd5e4a40dfc93546354848a38da09d90e4d5a1dae5d100b8106942acfc25ac3f705a2d3ab3b355162c74c7dfadbdb99a46cf2e5e0761f8542bfeb1  mesa-19.0.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-June/000523.html
+md5 4834e7951ba57bb8a2a403d9d5d93f31  mesa-19.0.7.tar.xz
+sha1 1c7cd71150082d52a5308aef17ad8b41a6d7f726  mesa-19.0.7.tar.xz
+sha256 d7bf3db2e442fe5eeb96144f8508d94f04aededdf37af477e644638d366b2b28  mesa-19.0.7.tar.xz
+sha512 eda02c426ad642c1f783aa376533c4f93354e819f99fd0187a88be2afd109effc9365e8d5ffd676202b006399674572d26b806da7f4c96adb8111243330cd121  mesa-19.0.7.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 23e7e9d5a5..9d6045f7fa 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.0.6
+MESA3D_VERSION = 19.0.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
