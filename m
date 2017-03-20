From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Mar 2017 19:16:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
	mesa3d-headers}: bump version to 17.0.2
Message-ID: <20170320181608.10058-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 4 ++--
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b55554964..505ffba75 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.0.1
+MESA3D_HEADERS_VERSION = 17.0.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e50b648fc..5766a1512 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-March/000305.html
-sha256 96fd70ef5f31d276a17e424e7e1bb79447ccbbe822b56844213ef932e7ad1b0c  mesa-17.0.1.tar.xz
+# From https://www.mesa3d.org/relnotes/17.0.2.html
+sha256 f8f191f909e01e65de38d5bdea5fb057f21649a3aed20948be02348e77a689d4  mesa-17.0.2.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d29a04349..9774f05d0 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.0.1
+MESA3D_VERSION = 17.0.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
