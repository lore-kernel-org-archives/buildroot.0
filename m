From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Nov 2016 14:41:35 +0000
Subject: [Buildroot] [PATCH 1/2] mesa3d: bump version to 13.0.0
Message-ID: <20161102144136.34786-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mesa3d/mesa3d.hash | 4 ++--
 package/mesa3d/mesa3d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 09923fd..7dbe1ac 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2016-September/000236.html
-sha256 1dc86dd9b51272eee1fad3df65e18cda2e556ef1bc0b6e07cd750b9757f493b1  mesa-12.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2016-November/000264.html
+sha256 94edb4ebff82066a68be79d9c2627f15995e1fe10f67ab3fc63deb842027d727  mesa-13.0.0.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1aa82d8..3237900 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 12.0.3
+MESA3D_VERSION = 13.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.10.1
