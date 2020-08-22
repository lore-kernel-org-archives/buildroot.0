From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Aug 2020 08:23:19 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.6
Message-ID: <20200822062319.167562-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 92b1db7741..27cee7388f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.1.5
+MESA3D_HEADERS_VERSION = 20.1.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 8974fa3cc2..e589eaeaff 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-August/000592.html
-sha256  fac1861e6e0bf1aec893f8d86dbfb9d8a0f426ff06b05256df10e3ad7e02c69b  mesa-20.1.5.tar.xz
-sha512  47796bf2cccfd054ff25f571747754e0ab9b42fe87644ea320b3d9497d63b3013e9b7e59ea0516bbd1a38b5594e0d185bf5a36230ea5c5974e7ff889cee2601e  mesa-20.1.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-August/000595.html
+sha256  23bed40114b03ad640c95bfe72cc879ed2f941d0d481b77b5204a1fc567fa93c  mesa-20.1.6.tar.xz
+sha512  5ef28334ecb7effaaf597ea3efe0406af62419e6fa629e835d843161ab8d83515626ec0f0495c4cc66af9e5669398ac96c16ca626e4965a9831e1704c995fb09  mesa-20.1.6.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 74c5818006..5f1ed5ebfb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.1.5
+MESA3D_VERSION = 20.1.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.27.0
