From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:13:05 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.2.5
Message-ID: <20181202071558.686488A3F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf7338c9034474fc9e64c238879bb0ca308a020b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 99dfb431a9..d1a836b145 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.2.4
+MESA3D_HEADERS_VERSION = 18.2.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9ee353ee15..c3464c3d0c 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-October/000471.html
-md5  33c4b4ad2f33d4faedec3206da7853d3  mesa-18.2.4.tar.xz
-sha1 9ebe58bdf03a1ff5e671de75f92c3c739edd3c4e  mesa-18.2.4.tar.xz
-sha256 621d1aebb57876d5b6a5d2dcf4eb7e0620e650c6fe5cf3655c65e243adc9cb4e  mesa-18.2.4.tar.xz
-sha512 088d43b087f4005752e4db75eaa6897e0fcb6de7b9a1f2d2b2ce3b5557d1dff829022e0092e8b1038ff01182c863ca0f26c97b9adde34bca462d3fa24502bfde  mesa-18.2.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-November/000475.html
+md5 b31a43ebb8b37fb704a9a75c90bbd71b  mesa-18.2.5.tar.xz
+sha1 1ada7d5fc5fabca63c78396b5afa587b94b9f2e0  mesa-18.2.5.tar.xz
+sha256 b12c32872832e5353155e1e8026e1f1ab75bba9dc5b178d712045684d26c2b73  mesa-18.2.5.tar.xz
+sha512 dd454c720241dffa61f3380be62479979a43004b2a52293b817bd3ea95f75960edee680e7380a13fae09b67a90dc0393e4a022d543db91b2f142f2468a9661f0  mesa-18.2.5.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1a1fb17c72..1651b5f260 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.2.4
+MESA3D_VERSION = 18.2.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
