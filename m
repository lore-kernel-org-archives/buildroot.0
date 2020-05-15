From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 May 2020 18:25:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.0.7
Message-ID: <20200515162529.1294572-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Patch created for master branch because 20.0.7 is a bugfix release.

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index c1686aa6fd..51b10acdb5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.0.6
+MESA3D_HEADERS_VERSION = 20.0.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index dec022c1e9..0a6d0c5a82 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-April/000579.html
-sha256  30b5d8e9201a01a0e88e18bb79850e67b1d28443b34c4c5cacad4bd10f668b96  mesa-20.0.6.tar.xz
-sha512  a93dc3ed57ed7469b7c60cdbdcf4f29c5da4ec3986171c7b534e009e136ca21fec16207ffab38a6747437a9b1060e2e6c4b74c4e5cdc168b9aba0fc1940b5e90  mesa-20.0.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-May/000583.html
+sha256  fe6e258fe772c3cd2ac01741bf7408058c3ac02d66acff9a6e669bd72e3ea178  mesa-20.0.7.tar.xz
+sha512  00baae50f14bf2b08b5654dffb11cf67499dc1825e1700b137fb5719e767e0e78e789979df2c194f677ea9c5e531f34965d47b9e37c239944c38d0570c7a9685  mesa-20.0.7.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 531dcf5b81..5304b05de0 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.0.6
+MESA3D_VERSION = 20.0.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.26.2
