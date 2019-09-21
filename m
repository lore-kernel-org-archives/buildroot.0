From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 20:50:04 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 19.1.7
Message-ID: <20190921185429.E35368EF6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e39c67be2931e553ac920264b5a69b208d3140eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 11 ++++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 9d6980c3d7..4b8f68412d 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.0.8
+MESA3D_HEADERS_VERSION = 19.1.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 0b82342fc6..62d81aed64 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-June/000525.html
-md5 9634964d87f1ce8d0230493e43f34c50  mesa-19.0.8.tar.xz
-sha1 5fd340a6304f7501014e1bd7291e4cfa7a6efcdb  mesa-19.0.8.tar.xz
-sha256 d017eb53a810c32dabeedf6ca2238ae1e897ce9090e470e9ce1d6c9e3f1b0862  mesa-19.0.8.tar.xz
-sha512 fbddc3a74f223564343027380af776b3fa5d63fe1af4e34121273235d1c6eced96439f601eb19bf658eb927aff3965b520f0329fcbd4650f3112167303e1746d  mesa-19.0.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-September/000545.html
+md5 cd1345c9b0d5121b860a0bdb20abc347  mesa-19.1.7.tar.xz
+sha1 5fcd2ee01087c821b5e644e007bb491563b9d4e0  mesa-19.1.7.tar.xz
+sha256 e287920fdb38712a9fed448dc90b3ca95048c7face5db52e58361f8b6e0f3cd5  mesa-19.1.7.tar.xz
+sha512 0865b5f91e5daa00e1da2b3d8b65fe5d2ff6332372bf8fec7d671d05d8d64ec5a7abea1858cdfc506c76b7226d2bea0af3426565f156b796d8e0f949ea33dc15  mesa-19.1.7.tar.xz
+
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d57f0e9140..6b250d3250 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.0.8
+MESA3D_VERSION = 19.1.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
