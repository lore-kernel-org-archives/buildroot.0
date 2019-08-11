From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Aug 2019 15:17:53 +0200
Subject: [Buildroot] [PATCH/next v9 10/12] package/{mesa3d,
 mesa3d-headers}: bump version to 19.1.4
In-Reply-To: <20190811131755.30840-1-bernd.kuhls@t-online.de>
References: <20190811131755.30840-1-bernd.kuhls@t-online.de>
Message-ID: <20190811131755.30840-10-bernd.kuhls@t-online.de>
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
index 9d6980c3d7..edc6fa895c 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.0.8
+MESA3D_HEADERS_VERSION = 19.1.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 0b82342fc6..e4dab7dbc6 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-June/000525.html
-md5 9634964d87f1ce8d0230493e43f34c50  mesa-19.0.8.tar.xz
-sha1 5fd340a6304f7501014e1bd7291e4cfa7a6efcdb  mesa-19.0.8.tar.xz
-sha256 d017eb53a810c32dabeedf6ca2238ae1e897ce9090e470e9ce1d6c9e3f1b0862  mesa-19.0.8.tar.xz
-sha512 fbddc3a74f223564343027380af776b3fa5d63fe1af4e34121273235d1c6eced96439f601eb19bf658eb927aff3965b520f0329fcbd4650f3112167303e1746d  mesa-19.0.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-August/000534.html
+md5 90eed05e3239c96ad9e92eb11eb67ada  mesa-19.1.4.tar.xz
+sha1 393053bfa41b7fc65add756713004f034c39c3ce  mesa-19.1.4.tar.xz
+sha256 a6d268a7d9edcfd92b6da80f2e34e6e0a7baaa442efbeba2fc66c404943c6bfb  mesa-19.1.4.tar.xz
+sha512 234032d917c9b378c3f6ceb921677b64e549344c3957331810b50fd73e0dccd2f4f62e2bd39e619590f389bc58fdab10fab4b88f7c117557cbeb1dda049b9fc5  mesa-19.1.4.tar.xz
+
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d57f0e9140..1497659202 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.0.8
+MESA3D_VERSION = 19.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
