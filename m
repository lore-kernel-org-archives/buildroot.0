From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Feb 2017 13:29:21 -0200
Subject: [Buildroot] [PATCH 1/2 v2] package/{mesa3d,
	mesa3d-headers}: bump version to 17.0.0
Message-ID: <1486999762-4118-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 4 ++--
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 2c62c48..1ff72f7 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 13.0.4
+MESA3D_HEADERS_VERSION = 17.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b3c4b77..09d3ef8 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-February/000294.html
-sha256 a95d7ce8f7bd5f88585e4be3144a341236d8c0fc91f6feaec59bb8ba3120e726  mesa-13.0.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-dev/2017-February/144115.html
+sha256 39db3d59700159add7f977307d12a7dfe016363e760ad82280ac4168ea668481  mesa-17.0.0.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 0c68ded..3bfb005 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 13.0.4
+MESA3D_VERSION = 17.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.7.4
