From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Nov 2016 14:01:36 +0000
Subject: [Buildroot] [PATCH next] package/{mesa3d,
	mesa3d-headers}: bump version to 13.0.1
Message-ID: <20161114140136.33344-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 4 ++--
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b3b80eb..523d10b 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 13.0.0
+MESA3D_HEADERS_VERSION = 13.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 7dbe1ac..0fab1de 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2016-November/000264.html
-sha256 94edb4ebff82066a68be79d9c2627f15995e1fe10f67ab3fc63deb842027d727  mesa-13.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2016-November/000270.html
+sha256 71962fb2bf77d33b0ad4a565b490dbbeaf4619099c6d9722f04a73187957a731  mesa-13.0.1.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e17db5c..031ce88 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 13.0.0
+MESA3D_VERSION = 13.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.10.1
