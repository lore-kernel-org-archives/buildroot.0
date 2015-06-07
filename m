From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Jun 2015 18:14:17 +0200
Subject: [Buildroot] [PATCH 2/3] package/{mesa3d,
	mesa3d-headers}: bump version to 10.5.7
In-Reply-To: <1433693658-20065-1-git-send-email-bernd.kuhls@t-online.de>
References: <1433693658-20065-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1433693658-20065-2-git-send-email-bernd.kuhls@t-online.de>
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
index 67cdf70..0979406 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 10.5.4
+MESA3D_HEADERS_VERSION = 10.5.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9b63e4d..b026245 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2015-April/000151.html
-sha256	b51e723f3a20d842c88a92d809435b229fc4744ca0dbec0317d9d4a3ac4c6803	mesa-10.5.4.tar.xz
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-June/000157.html
+sha256	04d06890cd69af8089d6ca76f40e46dcf9cacfe4a9788b32be620574d4638818	mesa-10.5.7.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f1f2304..4a419de 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 10.5.4
+MESA3D_VERSION = 10.5.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
