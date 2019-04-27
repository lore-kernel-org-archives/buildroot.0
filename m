From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 14:24:36 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 19.0.3
Message-ID: <20190427121956.E4B9E8156E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=022d85cce8d83ae380e58b04de00214a06b767ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 7696b3a861..22e3e1d28e 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.0.2
+MESA3D_HEADERS_VERSION = 19.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 8971e28a3b..d4d20c64bf 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-April/000508.html
-md5 7f84af1c3fe2078c35a7a991d1469921  mesa-19.0.2.tar.xz
-sha1 554dad1da57f9de09ac5732ba9a27ef26f9c3005  mesa-19.0.2.tar.xz
-sha256 1a2edc3ce56906a676c91e6851298db45903df1f5cb9827395a922c1452db802  mesa-19.0.2.tar.xz
-sha512 6b317205efa7d62150fae23489fbad5f062ecde99fb5b210fa7ccbed2e0ef60aee1f1e66e2c606ea5d59193c3218f732556706ab3b645b175044342d88984d51  mesa-19.0.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-April/000510.html
+md5 d03bf14e42c0e54ebae5730712ccc408 mesa-19.0.3.tar.xz
+sha1 e028365fb8c7ae73bb0f01807c9137ec856c8e52 mesa-19.0.3.tar.xz
+sha256 f027244e38dc309a4c12db45ef79be81ab62c797a50a88d566e4edb6159fc4d5 mesa-19.0.3.tar.xz
+sha512 aa170577252aa4157e4bd49076bbf6207e4aada9fc9f23b255de332e816f9c63e5661f752f2f276dd43e232a8926866004e2a2ff9ad4b411330969c2a9a7ffa0 mesa-19.0.3.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 02c8a8a57a..576e8f0a2d 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.0.2
+MESA3D_VERSION = 19.0.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
