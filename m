From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 16 Dec 2020 22:41:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.3.1
Message-ID: <20201216214149.399328-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2020-December/000612.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 40d9979e57..40fbf0f27f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.3.0
+MESA3D_HEADERS_VERSION = 20.3.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 76436bdc70..45b69d8944 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-December/000609.html
-sha256  2999738e888731531cd62b27519fa37566cc0ea2cd7d4d97f46abaa3e949c630  mesa-20.3.0.tar.xz
-sha512  69ee0bc1e7a69a519597dd55f4d601f35fe51ed6687d6f6beff6aef3da8d82de932220305fc187e06a52aaf0073d434a6e3458619c767b9b7932464a2cbb2cf2  mesa-20.3.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-December/000612.html
+sha256  af751b49bb2ab0264d58c31e73d869e80333de02b2d1becc93f1b28c67aa780f  mesa-20.3.1.tar.xz
+sha512  06638b8d2d866b5e27024c58a2ca03a73869221a7d536f7a8f1679d73708e5c1713446c8fedc594844b95596ae817bfceb88ace6b42423328189778e5036edf6  mesa-20.3.1.tar.xz
 
 # License
 sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 58fc7b1706..82a0f07840 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.3.0
+MESA3D_VERSION = 20.3.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.29.2
