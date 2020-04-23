From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Apr 2020 07:31:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.0.5
Message-ID: <20200423053123.817991-1-bernd.kuhls@t-online.de>
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
index 077798ac77..2801da1156 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.0.4
+MESA3D_HEADERS_VERSION = 20.0.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index de8e92bc39..598d59429b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-April/000577.html
-sha256 c4ed491517a94118a7a611810eeb92645d42ffd82280dcd51be8cc2ba1aabba5  mesa-20.0.4.tar.xz
-sha512 17d8bc3b56779a8e5648d81da9ee97b66bcec015710801edce4e8055fbb314cd9ebc1d112e3035480ba844c7d9ae6b5b1f1eac0cc0817e69e9253a7748451a55  mesa-20.0.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-April/000578.html
+sha256  2c56a82a28cc924e40ea49752abdf1d701c9952481f53cbc7a080271597f572e  mesa-20.0.5.tar.xz
+sha512  6f5780f7574400fea54978b40eb97faca35826a8a7bed96362d7bebcda78e2cadd44585ef8dd7dc126e0cc62cff61bee9b2ea360fedcc09a1fbb4c1f20c6aa08  mesa-20.0.5.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 111151d342..22eff24c56 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.0.4
+MESA3D_VERSION = 20.0.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.26.2
