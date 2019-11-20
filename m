From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 Nov 2019 20:47:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 19.2.5
Message-ID: <20191120194707.4146-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes of this bugfix release:
https://lists.freedesktop.org/archives/mesa-announce/2019-November/000557.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 44dc131877..2deb063be2 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.2.4
+MESA3D_HEADERS_VERSION = 19.2.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 89b0a13196..c885e05a4d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-November/000555.html
-sha256 09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c0329181968596e548e30f  mesa-19.2.4.tar.xz
-sha512 e8a0e90460f3153d730f8fb13f2c912a9826c05d2af9e22dc575bcd8885bf6a33c0af1c6659e81701ff097a132df88eead208e89dceb552b9da809ab543fa479  mesa-19.2.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-November/000557.html
+sha256 3d010a366b28d10bdd71e32091d8684baf1522e6466c5c5703667091b2108c8b  mesa-19.2.5.tar.xz
+sha512 881735c4fec07fb6557d01c2d5bb7971e2d4b2bedbb52fd1025dfb0222f8b1cbca080b6f849efe19ff514da8e6310fc6f0cde5b59fcc1c6a10e593876bcd6a38  mesa-19.2.5.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6e7fa7692c..80b79af688 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.2.4
+MESA3D_VERSION = 19.2.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
