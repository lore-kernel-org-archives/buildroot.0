From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 23:24:36 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 19.2.6
Message-ID: <20191122222027.EC4098F692@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ee02eaaee90a7f1f00b44985624f466dc386a83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes of this bugfix release:
https://lists.freedesktop.org/archives/mesa-announce/2019-November/000559.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index eee6acbe8e..e4d54aae6a 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.2.5
+MESA3D_HEADERS_VERSION = 19.2.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index c885e05a4d..d1dbfc603c 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-November/000557.html
-sha256 3d010a366b28d10bdd71e32091d8684baf1522e6466c5c5703667091b2108c8b  mesa-19.2.5.tar.xz
-sha512 881735c4fec07fb6557d01c2d5bb7971e2d4b2bedbb52fd1025dfb0222f8b1cbca080b6f849efe19ff514da8e6310fc6f0cde5b59fcc1c6a10e593876bcd6a38  mesa-19.2.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-November/000559.html
+sha256 9d7b24fa60c82db34788196450042a55ce6cb2d70c7a8d5c31401619b6907797  mesa-19.2.6.tar.xz
+sha512 2e961631ae8ea1cb64d87bede51432445a17d153244d8c76f5eb70cbdc8c069d3f08cac11928d85ce2730d772aff9b3aff089e5e552eb021fdcb65364bb685b6  mesa-19.2.6.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 80b79af688..fff498e777 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.2.5
+MESA3D_VERSION = 19.2.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
