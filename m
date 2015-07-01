From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Jul 2015 21:54:53 +0200
Subject: [Buildroot] [PATCH 1/4] package/{mesa3d,
	mesa3d-headers}: bump version to 10.6.1
Message-ID: <1435780496-31814-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |    2 +-
 package/mesa3d/mesa3d.hash               |    4 ++--
 package/mesa3d/mesa3d.mk                 |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 07340f7..c5f2dba 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 10.6.0
+MESA3D_HEADERS_VERSION = 10.6.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 456348f..5c34a9e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2015-June/000158.html
-sha256	f37e2633978deed02ff0522abc36c709586e2b555fd439a82ab71dce2c866c76	mesa-10.6.0.tar.xz
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-June/000161.html
+sha256	6c80a2b647e57c85dc36e609d9aed17f878f0d8e0cf9ace86d14cf604101e1eb	mesa-10.6.1.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 486a665..051aac7 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 10.6.0
+MESA3D_VERSION = 10.6.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
