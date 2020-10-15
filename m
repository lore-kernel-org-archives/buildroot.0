From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Oct 2020 19:15:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.10
Message-ID: <20201015171518.13674-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ee0afd0c47..572b7ccc8c 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.1.9
+MESA3D_HEADERS_VERSION = 20.1.10
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index eb7676e564..69f387a45e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-September/000601.html
-sha256  b251ca0769b722058986640d48f8457c596142cfbee1a83cba91b83391427382  mesa-20.1.9.tar.xz
-sha512  0fb8ceff3c91ad2076efb0b2ac7e95d2d72ff1df955eb8fedf712ceaa7f49184eae9958072edd872f5c38adbaeb867988f67627b33da8b208706f69325d7e260  mesa-20.1.9.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-October/000603.html
+sha256  b1dba69910adac9fcb4cbdfd7833d99a4a8c75b91f3d2e97f0fd0a3cd8c6ee9f  mesa-20.1.10.tar.xz
+sha512  0d4016abfcc733c853d7b6c3c997ddc554a44088c0a4d9a7edb51ab5ad7d9e1234728b61ffcb9c82a6c5fee1429091a1c31cbeabcb1b50411337b99ee550d28a  mesa-20.1.10.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 96ed3037b4..4a1939f1f6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.1.9
+MESA3D_VERSION = 20.1.10
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.27.0
