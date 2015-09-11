From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 14:37:15 +0100
Subject: [Buildroot] [PATCHv2] mesa3d: bump version to 10.6.7
Message-ID: <1441978635-44174-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
  - Also bump mesa3d-headers (Thomas Petazzoni)

 package/mesa3d-headers/mesa3d-headers.mk |    2 +-
 package/mesa3d/mesa3d.hash               |    4 ++--
 package/mesa3d/mesa3d.mk                 |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 2eaa515..561fe57 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 10.6.6
+MESA3D_HEADERS_VERSION = 10.6.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index d957357..4461638 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://cgit.freedesktop.org/mesa/mesa/commit/?id=f39bc1c828e14b8e8d71ea02e4c21ea7397a1ab4
-sha256	570f2154b7340ff5db61ff103bc6e85165b8958798b78a50fa2df488e98e5778	mesa-10.6.6.tar.xz
+# From http://cgit.freedesktop.org/mesa/mesa/commit/?id=ded289e3480a8e9421754d920d7ee5f174d9c5a5
+sha256 feb1f640b915dada88a7c793dfaff0ae23580f8903f87a6b76469253de0d28d8  mesa-10.6.7.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2242360..0244523 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 10.6.6
+MESA3D_VERSION = 10.6.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.1
