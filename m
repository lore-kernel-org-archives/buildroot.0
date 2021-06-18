From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Jun 2021 21:35:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.1.3
Message-ID: <20210618193547.828627-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2021-June/000633.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1b56494571..e3bdeaa923 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.1.2
+MESA3D_HEADERS_VERSION = 21.1.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 8bd98ec6e5..8d07fc373b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-June/000632.html
-sha256  23b4b63760561f3a4f98b5be12c6de621e9a6bdf355e087a83d9184cd4e2825f  mesa-21.1.2.tar.xz
-sha512  a7907fa29fdb4e137015ee5405b9c8c0769ef9354bbe963c1af80318b398c05c79db6129b583106d620c42a5e9b625611b648fd5207334eb9b588d7963defc70  mesa-21.1.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-June/000633.html
+sha256 cbe221282670875ffd762247b6a2c95dcee91d0a34c29802c75ef761fc891e69  mesa-21.1.3.tar.xz
+sha512 8ca6d5516035484ea2a63bc6338794003ef167239ab0c220f8d3693f97f9725b46fc9d9a704c4ba11b83197d4b8e5f658d65ef0cce1e0957f5e58bd13726b9e0  mesa-21.1.3.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 34bcd4df34..13fde2cf01 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.1.2
+MESA3D_VERSION = 21.1.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.30.2
