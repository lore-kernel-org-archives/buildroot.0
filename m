From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 May 2017 10:16:51 +0200
Subject: [Buildroot] [PATCH/next] package/{mesa3d,
	mesa3d-headers}: bump version to 17.0.6
Message-ID: <20170513081651.3088-1-bernd.kuhls@t-online.de>
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
index d0dceb7d5..fbde9ec33 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.0.5
+MESA3D_HEADERS_VERSION = 17.0.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 3e1017837..ccd1afe7c 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-April/000322.html
-md5 5587b6b693260e3a3125f60fed6a625d  mesa-17.0.5.tar.xz
-sha1 030fe080bb53377e44ece3f99b969af08e4a4ff8  mesa-17.0.5.tar.xz
-sha256 668efa445d2f57a26e5c096b1965a685733a3b57d9c736f9d6460263847f9bfe  mesa-17.0.5.tar.xz
-sha512 942fa62c9098bcd030856cd622696eae418f292addb912e1d558cf27d396f25c3f2000dae97a12d1ff233f1ea157497259442082005035bb27b9bafb2cfc33c3  mesa-17.0.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-May/000327.html
+md5 77ea38dc0ab899864b06ea2941ac31a4  mesa-17.0.6.tar.xz
+sha1 f348781d5e4342ef5b78572f68ef9749e308dbd7  mesa-17.0.6.tar.xz
+sha256 89ecf3bcd0f18dcca5aaa42bf36bb52a2df33be89889f94aaaad91f7a504a69d  mesa-17.0.6.tar.xz
+sha512 537d28aa694c2d48811d2467e33b3adc841067d5f1cdb7e0809ba100f71869090285bbb246e57e5f0177401a539b44cc32b1ccfcb32a1855c14b011b92d32eaf  mesa-17.0.6.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b26d67747..1404f8407 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.0.5
+MESA3D_VERSION = 17.0.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
