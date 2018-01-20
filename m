From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Jan 2018 08:43:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 17.3.3
Message-ID: <20180120074331.5299-1-bernd.kuhls@t-online.de>
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
index 7b50b8f2bc..b543fc097a 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.3.2
+MESA3D_HEADERS_VERSION = 17.3.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f16a3905cf..f7a77b56b0 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-January/000388.html
-md5  5c59b779925f504ffd0f13c7dcd29ac6  mesa-17.3.2.tar.xz
-sha1 d3fd1b57a5b853d91150aea8db033e6c995fd9e9  mesa-17.3.2.tar.xz
-sha256 e2844a13f2d6f8f24bee65804a51c42d8dc6ae9c36cff7ee61d0940e796d64c6  mesa-17.3.2.tar.xz
-sha512 46a85f5f5f9a503bc0e3f8c4469ffaa5cec3861070321d5d9cb5805c6d3ea50ae2a5438f012f467cb57d7e3b7c1e67ddabbfbf44e0fabb5856802454c576a5d3  mesa-17.3.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-January/000393.html
+md5 139b5f608b371c0d4395596162f88791  mesa-17.3.3.tar.xz
+sha1 346f7813f493b1daf9d9079826a13dbd722b86ab  mesa-17.3.3.tar.xz
+sha256 41bac5de0ef6adc1f41a1ec0f80c19e361298ce02fa81b5f9ba4fdca33a9379b  mesa-17.3.3.tar.xz
+sha512 7ac8ecdcf3b2b43239835bc2c5da7f2730f80a2db945fe00df03d1548920fbc074dd4806ddd345a1ce682fd29d75b2209ef81b6b06e657f9c8ae8622a34a03c1  mesa-17.3.3.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2eadc862e4..3f907c9463 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.3.2
+MESA3D_VERSION = 17.3.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
