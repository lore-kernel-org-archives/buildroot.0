From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Jul 2018 09:14:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.1.4
Message-ID: <20180714071441.11867-1-bernd.kuhls@t-online.de>
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
index c598444b5f..8c317916e5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.1.3
+MESA3D_HEADERS_VERSION = 18.1.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f4564d0da7..7279e8d9f3 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-June/000439.html
-md5 b34273403a605f6f98ead00f0bdf8e0b  mesa-18.1.3.tar.xz
-sha1 0a5fb3096108a95f913411267b8a374f9ff547b2  mesa-18.1.3.tar.xz
-sha256 54f08deeda0cd2f818e8d40140040ed013de7852573002453b7f50da9ea738ce  mesa-18.1.3.tar.xz
-sha512 f6e5b81a80a309a36a04759d18364d3c71c48d1cb88f87b2f5432ef003092a22046e88ce2082031d5d52b60ba36f585d8df52e06ecc7a5158079936236f36887  mesa-18.1.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-July/000442.html
+md5 7abc628e2e34b2f478d906b6d233ade3  mesa-18.1.4.tar.xz
+sha1 b5af29aff8b7abe070103ea2cc625d38b4eb1611  mesa-18.1.4.tar.xz
+sha256 3061488b5d85504092cf4343816cfb2d96f2ad9bc2edec31fc96933d184cf58b  mesa-18.1.4.tar.xz
+sha512 04b8e5bbfa640f2303c388ab701fc2aca7f6d5d127ca5a9f9409975556813ba8e94305d27c9cea236a0e6d44a38b97e2877509268a96d9ed2a6762ab385aa3dc  mesa-18.1.4.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 3a0cf6c7835f98f86d5579b2cc517f84254da7411f764fb0095a383fb0759771  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7737143874..35a15bd3a8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.1.3
+MESA3D_VERSION = 18.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.18.0
