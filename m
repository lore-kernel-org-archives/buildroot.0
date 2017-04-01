From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Apr 2017 21:08:23 +0200
Subject: [Buildroot] [PATCH 3/3] package/{mesa3d,
	mesa3d-headers}: bump version to 17.0.3
In-Reply-To: <20170401190823.11566-1-bernd.kuhls@t-online.de>
References: <20170401190823.11566-1-bernd.kuhls@t-online.de>
Message-ID: <20170401190823.11566-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched hash to sha512.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 4 ++--
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 505ffba75..0dd262c2a 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.0.2
+MESA3D_HEADERS_VERSION = 17.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 5766a1512..1ac8d86ab 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://www.mesa3d.org/relnotes/17.0.2.html
-sha256 f8f191f909e01e65de38d5bdea5fb057f21649a3aed20948be02348e77a689d4  mesa-17.0.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-April/000315.html
+sha512 0bcf1609b54fdabb30ec0a500b78e039bd50060c2c7f5a2e57fca29e1a311fb785dadc3cd311018ebe8020d1cc6320181ece2d2aa39d2f215b0ebf2cb0a55165  mesa-17.0.3.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8bd6da624..2e6528876 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.0.2
+MESA3D_VERSION = 17.0.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
