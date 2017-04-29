From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 15:52:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
	mesa3d-headers}: bump version to 17.0.5
Message-ID: <20170429135248.32443-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 7 +++++--
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0dd262c2a..d0dceb7d5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.0.3
+MESA3D_HEADERS_VERSION = 17.0.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 1ac8d86ab..3e1017837 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-April/000315.html
-sha512 0bcf1609b54fdabb30ec0a500b78e039bd50060c2c7f5a2e57fca29e1a311fb785dadc3cd311018ebe8020d1cc6320181ece2d2aa39d2f215b0ebf2cb0a55165  mesa-17.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-April/000322.html
+md5 5587b6b693260e3a3125f60fed6a625d  mesa-17.0.5.tar.xz
+sha1 030fe080bb53377e44ece3f99b969af08e4a4ff8  mesa-17.0.5.tar.xz
+sha256 668efa445d2f57a26e5c096b1965a685733a3b57d9c736f9d6460263847f9bfe  mesa-17.0.5.tar.xz
+sha512 942fa62c9098bcd030856cd622696eae418f292addb912e1d558cf27d396f25c3f2000dae97a12d1ff233f1ea157497259442082005035bb27b9bafb2cfc33c3  mesa-17.0.5.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2e6528876..b26d67747 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.0.3
+MESA3D_VERSION = 17.0.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
