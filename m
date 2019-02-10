From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Feb 2019 11:04:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.3.3
Message-ID: <20190210100413.20176-1-bernd.kuhls@t-online.de>
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
index a1b0f4909d..4730463eac 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.3.2
+MESA3D_HEADERS_VERSION = 18.3.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 78e8c3c291..b0774ff407 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-January/000489.html
-md5 4a82bf3ac2e81493a1a84dd7581ec786  mesa-18.3.2.tar.xz
-sha1 8775d7bfac7e07141ac4299888d426d5550949f7  mesa-18.3.2.tar.xz
-sha256 f7ce7181c07b6d8e0132da879af1729523a6c8aa87f79a9d59dfd064024cfb35  mesa-18.3.2.tar.xz
-sha512 34b66520728d720b1f3d3d63f8ba5c255d57b9e8fe427264419e4163b474df662ff6db9ca8b81283866da415e34346a4c39fc37bebe2a0929be14480faf4db45  mesa-18.3.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-February/000492.html
+md5 e9d1a24dbd5ca20efa75b9a29eb4566f  mesa-18.3.3.tar.xz
+sha1 abb067204ae31493dba7710c378b2b90245108ca  mesa-18.3.3.tar.xz
+sha256 2ab6886a6966c532ccbcc3b240925e681464b658244f0cbed752615af3936299  mesa-18.3.3.tar.xz
+sha512 cd6214b8bbeb3e3d187139ae1e949684f32f90152e1d7ba8d81222bd088770e28cff7ff165f2ccc41c068950561fe952420c6e54472f7204532a8d8700ff18bb  mesa-18.3.3.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 73e35aa281..c3469f7788 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.3.2
+MESA3D_VERSION = 18.3.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
