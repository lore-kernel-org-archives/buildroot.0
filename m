From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Jul 2016 15:22:32 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 12.0.1
Message-ID: <20160710132237.0CEF081E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3c48ddd32b06d6141c1a9fabd1422b22e288423
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 4 ++--
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 2b1e4d8..c3b57e4 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 12.0.0
+MESA3D_HEADERS_VERSION = 12.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 3572b46..fa01128 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2016-July/000226.html
-sha256	0090c025219318935124292b482e3439bc43e8c074ad01086449fcad88547dc6	mesa-12.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2016-July/000227.html
+sha256	bab24fb79f78c876073527f515ed871fc9c81d816f66c8a0b051d8d653896389	mesa-12.0.1.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index dcccb41..9cce0ef 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 12.0.0
+MESA3D_VERSION = 12.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
