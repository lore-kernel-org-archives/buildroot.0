From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jun 2018 13:14:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.1.3
Message-ID: <20180630111411.18182-1-bernd.kuhls@t-online.de>
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
index 846091eb57..c598444b5f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.1.2
+MESA3D_HEADERS_VERSION = 18.1.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 77b3eb1c67..f4564d0da7 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-June/000437.html
-md5 a2d4f031eb6bd6111d44d84004476918  mesa-18.1.2.tar.xz
-sha1 938d22b966e9861a5387d31c44cd4753931d3076  mesa-18.1.2.tar.xz
-sha256 070bf0648ba5b242d7303ceed32aed80842f4c0ba16e5acc1a650a46eadfb1f9  mesa-18.1.2.tar.xz
-sha512 1b896ecc42c2f81813d551a2b14d271d274a948fa10bf5b7a567417690316c2ab7e7fdd52fe004732cd1a47661ba91acf7d5b21e3b3f28e21b50aadbfa96a5d5  mesa-18.1.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-June/000439.html
+md5 b34273403a605f6f98ead00f0bdf8e0b  mesa-18.1.3.tar.xz
+sha1 0a5fb3096108a95f913411267b8a374f9ff547b2  mesa-18.1.3.tar.xz
+sha256 54f08deeda0cd2f818e8d40140040ed013de7852573002453b7f50da9ea738ce  mesa-18.1.3.tar.xz
+sha512 f6e5b81a80a309a36a04759d18364d3c71c48d1cb88f87b2f5432ef003092a22046e88ce2082031d5d52b60ba36f585d8df52e06ecc7a5158079936236f36887  mesa-18.1.3.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 3a0cf6c7835f98f86d5579b2cc517f84254da7411f764fb0095a383fb0759771  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index cafc41f97d..7737143874 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.1.2
+MESA3D_VERSION = 18.1.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.17.1
