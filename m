From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 17 Apr 2017 20:12:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
	mesa3d-headers}: bump version to 17.0.4
Message-ID: <20170417181236.2799-1-bernd.kuhls@t-online.de>
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
index 0dd262c2a..d247ffa27 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.0.3
+MESA3D_HEADERS_VERSION = 17.0.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 1ac8d86ab..b7f7924ef 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-April/000315.html
-sha512 0bcf1609b54fdabb30ec0a500b78e039bd50060c2c7f5a2e57fca29e1a311fb785dadc3cd311018ebe8020d1cc6320181ece2d2aa39d2f215b0ebf2cb0a55165  mesa-17.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-April/000318.html
+md5 4a16cfc1c6d034cc17314b866eada628  mesa-17.0.4.tar.xz
+sha1 1b9081614b1ec9a6f60849ced8637917ad0e8593  mesa-17.0.4.tar.xz
+sha256 1269dc8545a193932a0779b2db5bce9be4a5f6813b98c38b93b372be8362a346  mesa-17.0.4.tar.xz
+sha512 0b465dc165b55e4b2ae61aca2d2c6694714522885a14fb61272f73e685aef734be4aac3d58b8d2ceb2643db0578c6187da35fe2cbe41b62a89564e60659b201d  mesa-17.0.4.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2e6528876..5d144dc72 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.0.3
+MESA3D_VERSION = 17.0.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
